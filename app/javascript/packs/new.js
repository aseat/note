var i = 1 ;
function addForm() {
  var input_data = document.createElement('input');
  input_data.type = 'text';
  input_data.id = 'inputform_' + i;
  input_data.placeholder = 'フォーム-' + i;
  var parent = document.getElementById('form_area');
  parent.appendChild(input_data);

  var button_data = document.createElement('button');
  button_data.id = i;
  button_data.onclick = function(){deleteBtn(this);}
  button_data.innerHTML = '削除';
  var input_area = document.getElementById(input_data.id);
  parent.appendChild(button_data);

  i++ ;
}

function deleteBtn(target) {
  var target_id = target.id;
  var parent = document.getElementById('form_area');
  var ipt_id = document.getElementById('inputform_' + target_id);
  var tgt_id = document.getElementById(target_id);
  parent.removeChild(ipt_id);
  parent.removeChild(tgt_id);	
}