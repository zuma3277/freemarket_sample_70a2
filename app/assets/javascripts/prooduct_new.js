$(document).on('turbolinks:load',function(){
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