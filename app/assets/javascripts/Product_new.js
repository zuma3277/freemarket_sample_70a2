

$(document).on('turbolinks:load',function(){
  //写真の複数投稿機能
  $('#input-img').on('change',function(e){
    // 画像が選択された時プレビュー表示、inputの親要素のdivをイベント元に指定

    //ファイルオブジェクトを取得する
    let files = e.target.files;
    $.each(files, function(index,file){
      let reader = new FileReader(); 

      //画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      };

      //アップロードした画像を設定する
      reader.onload = (function(file){
        return function(e){
          let imageLength = $('#output-box').children('li').length;
          // 表示されているプレビューの数を数える

          let labelLength = $("#input-img>label").eq(-1).data('label-id');

          $('#input-img').before(`<li class="preview-image" id="upload-image${labelLength}" data-image-id="${labelLength}">
                                      <figure class="preview-image__figure">
                                        <img src='${e.target.result}' title='${file.name}' >
                                      </figure>
                                      <div class="preview-image__button">
                                        <a href="" class="preview-image__button__delete" data-image-id="${labelLength}">削除</a>
                                      </div>
                                    </li>`);
          $("#input-img>label").eq(-1).css('display','none');
          // 入力されたlabelを見えなくする

          if (imageLength < 9) {
            // 表示されているプレビューが９以下なら、新たにinputを生成する
            $("#input-img").append(`<label for="input-images${labelLength+1}" class="input-label" data-label-id="${labelLength+1}">
                                        <input multiple="multiple" class="input-function" id="input-images${labelLength+1}" style="display: none;" type="file" >
                                        <img class="logo_camera" src="/assets/icon_camera-24c5a3dec3f777b383180b053077a49d0416a4137a1c541d7dd3f5ce93194dee.png">
                                        <p class="input-text">
                                          ドラックアンドドロップ
                                          またはクリックしてファイルをダウンロード
                                        </p>
                                      </label>`);
          };
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });


  $(document).on("click","preview-image__button__delete",function(){
    let targetImageId = $(this).data('image-id');

    $(`#upload-image${targetImageId}`).remove();

    $(`[for=input_images${targetImageId}]`).remove();

    let imageLength = $('#output-box').children('li').length;
    if (imageLength < 9) {
      let labelLength = $("#input-img>label").eq(-1).data('label-id');
      // 表示されているプレビューが９以下なら、新たにinputを生成する
      $("#input-img").append(`<label for="input-images${labelLength+1}" class="input-label" data-label-id="${labelLength+1}">
                                  <input multiple="multiple" class="input-function" id="input-images${labelLength+1}" style="display: none;" type="file" >
                                  <img class="logo_camera" src="/assets/icon_camera-24c5a3dec3f777b383180b053077a49d0416a4137a1c541d7dd3f5ce93194dee.png">
                                  <p class="input-text">
                                    ドラックアンドドロップ
                                    またはクリックしてファイルをダウンロード
                                  </p>
                                </label>`);
    };
  });


  //商品の説明の文字カウント機能

  $('.input-sentences').keyup(function(){
    var count =$(this).val().length;
    $('.count').text(count);
  });




  //カテゴリーの選択機能
   
  $(function(){
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<select class="main_select-wrapper__box--select" id="child_category" name="product[category]">
                        <option value="---">---</option>
                        ${insertHTML}
                      </select>`;
    $('.main_select-wrapper__box').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<select class="main_select-wrapper__box--select" id="grand_child_category" name="product[category]">
                              <option value="---">---</option>
                              ${insertHTML}
                            </select>`;
    $('.main_select-wrapper__box').append(grandchildSelectHtml);
  }
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; 
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grand_children_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grand_children_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  $('.main_display__title').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "---"){ 
      $.ajax({
        url: 'get_category_grand_children',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); 
      $('#brand_wrapper').remove();
    }
  });
  });
});