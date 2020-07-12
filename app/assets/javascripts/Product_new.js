$(function(){
  function categoryOption(category){
    var optionHtml = `<option value="${category.id}">${category.name}</option>`;
    return optionHtml;
  }
  $('#category-select-parent').on('change', function(){
    let parentCategoryId = $(this).val();
    if (parentCategoryId == ''){
      $('#select-children-box').remove();
      $('#select-grandchildren-box').remove();
    }else{
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { parent_id: parentCategoryId },
        dataType: 'json'
      })
      .done(function(category_children){
        $('#select-children-box').remove();
        $('#select-grandchildren-box').remove();
        let optionHtml = '';
        category_children.forEach(function(child){
          optionHtml += categoryOption(child);
        });
        $('#error-category').before(`<div class="sell-collection_select " id="select-children-box">
                                        <label class="sell-collection_select__label" for="item_category_id">
                                          <select class="sell-collection_select__input" id="category-select-children" required="required" name="item[category_id]">
                                            <option value="">選択して下さい</option>
                                            ${optionHtml}
                                          </select>
                                          <i class="fas fa-chevron-down"></i>
                                        </label>
                                      </div>`
        );
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }
  });
  $('.sell-container__content__details').on('change', '#category-select-children', function(){
    let childrenCategoryId = $(this).val();
    if (childrenCategoryId == ''){
      $('#select-grandchildren-box').remove(); 
    }else{
      $.ajax({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { child_id: childrenCategoryId },
        dataType: 'json'
      })
      .done(function(category_grandchildren){
        $('#select-grandchildren-box').remove();
        let optionHtml = '';
        category_grandchildren.forEach(function(grandchildren){
          optionHtml += categoryOption(grandchildren);
        });
        $('#error-category').before(`<div class="sell-collection_select " id="select-grandchildren-box">
                                        <label class="sell-collection_select__label" for="item_category_id">
                                          <select class="sell-collection_select__input" id="category-select-grandchildren" required="required" name="item[category_id]">
                                            <option value="">選択して下さい</option>
                                            ${optionHtml}
                                          </select>
                                          <i class="fas fa-chevron-down"></i>
                                        </label>
                                      </div>`
        );
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }
  });
});
