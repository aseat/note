var original = $('#form_block\\[' + frm_cnt + '\\]');
      var originCnt = frm_cnt;
      var originVal = $("input[name='sex\\[" + frm_cnt + "\\]']:checked").val();
      frm_cnt++;

      original
          .clone()
          .hide()
          .insertAfter(original)
          .attr('id', 'form_block[' + frm_cnt + ']') // クローンのid属性を変更。
          .find("input[type='radio'][checked]").prop('checked', true)
          .end() // 一度適用する
          .find('input, textarea').each(function(idx, obj) {
              $(obj).attr({
                  id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
                  name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
              });
              $(obj).val('');
          });

          var removeObj = $(this).parent();
        removeObj.fadeOut('fast', function() {
            removeObj.remove();
            // 番号振り直し
            frm_cnt = 0;
            $(".form-block[id^='form_block']").each(function(index, formObj) {
                if ($(formObj).attr('id') != 'form_block[0]') {
                    frm_cnt++;
                    $(formObj)
                        .attr('id', 'form_block[' + frm_cnt + ']') // id属性を変更。
                        .find('input, textarea').each(function(idx, obj) {
                            $(obj).attr({
                                id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
                                name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
                            });
                        });
                }
            });
        });