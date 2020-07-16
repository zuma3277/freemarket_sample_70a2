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