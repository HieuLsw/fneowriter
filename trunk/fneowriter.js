function setCookie(name, value, expiredays) 
{
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=\; expires=" + todayDate.toGMTString() + ";";
}

function getCookie(name) 
{
	var nameOfCookie = name + "=";
	var x = 0;
	while (x <= document.cookie.length)
	{
		var y = (x + nameOfCookie.length);
		if (document.cookie.substring(x, y) == nameOfCookie) 
		{
			if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
				endOfCookie = document.cookie.length;
			return unescape(document.cookie.substring(y, endOfCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if (x == 0) break;
	}
	return "";
}

function save_nickname()
{
  setCookie("nickname", document.userdata.nickname.value, 30);
}
function save_hidecheck()
{
  setCookie("hidecheck", document.hideform.hidecheck.checked ? "Y" : "N", 30);
}

function mymySubmit()
{
  save_nickname();
  save_hidecheck();

  var form = document.bbs;
  form.p_act.value = "new";

  //orm.p_subject.value = form.txtarea.value;
  form.p_subject.value = form.p_subject.value.replace(/\n/gi, "<br>");

  form.target='_self';
  form.action = "http://club.nate.com/jsps/bbs/bbs_register.jsp";
  form.submit();
  
  //alert(form.p_subject.value);
}

function handle_hidecheck()
{

  if ( document.hideform.hidecheck.checked ) 
    document.getElementById("loginfrm").style.cssText="display:none";
  else
    document.getElementById("loginfrm").style.cssText="display:inline";
}
