<form action="spieler.php" method="POST">
<input type="hidden" name="ft" value="p3">
<input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
	
<h4 class="round">تغییر رمز</h4>

<table cellpadding="1" cellspacing="1" id="change_pass" class="account transparent">
	<tbody>
		<tr>
			<th class="col1">رمز فعلی</th>
			<td><input class="text" type="password" name="pw1" maxlength="20"></td>
		</tr>
		<tr>
			<th>رمز جدید</th>
			<td><input class="text" type="password" name="pw2" maxlength="20"></td>
		</tr>
		<tr>
			<th>تایید:</th>
			<td><input class="text" type="password" name="pw3" maxlength="20"></td>
		</tr>

	</tbody>
</table>
<?php
if($form->getError("pw") != "") {
echo "<span class=\"error\">".$form->getError('pw')."</span>";
}
?>
	<h4 class="round spacer">تغییر آدرس ایمیل</h4>
	<table id="change_mail" cellpadding="1" cellspacing="1" class="transparent">
		<tbody>
			<tr>
				<td colspan="2">لطفاً آدرس ایمیل فعلی و جدید خود را وارد کنید. به هر دو آدرس ایمیل کدی ارسال خواهد شد که باید آنها را در همین قسمت وارد کنید.					</td>
			</tr>
			<tr>
				<th>ایمیل فعلی:</th>
				<td><input class="text" type="text" name="email_alt" maxlength="50" size="40"></td>
			</tr>
			<tr>
				<th>ایمیل جدید:</th>
				<td><input class="text" type="text" name="email_neu" maxlength="50" size="40"></td>
			</tr>
		</tbody>
	</table>
    <?php
if($form->getError("email") != "") {
echo "<span class=\"error\">".$form->getError('email')."</span>";
}
?>
<h4 class="round spacer">جانشین های این اکانت</h4>
<input type="hidden" name="sitter_flag_posted" value="1">

<div class="text">جانشین با نام اکانت شما و با رمز خود قادر به وارد شدن به اکانت شما می باشد. شما حداکثر می توانید 2 جانشین برای خود انتخاب کنید.</div>

<script type="text/javascript">
function cloneName(obj, id)
{
	$(id).innerHTML = obj.value.stripTags();
}

</script>

<table class="sitters transparent">
				<tbody><tr>
		<th>
				<div class="boxes boxesColor lightGreen"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>جانشین 1				</span>	</div>
				</div>
		</th><td>
<?php

if($session->userinfo['sit1'] == 0) {
echo "<input class=\"text\" type=\"text\" name=\"v1\" maxlength=\"15\">";
}
if($session->userinfo['sit1'] != 0) {
	
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->userinfo['sit1']."&a=".$session->checker."&type=1'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"حذف جانشین\"></button>";
    echo "&nbsp;".$database->getUserField($session->userinfo['sit1'],"username",0)."";

}
?></td>
	</tr>
				<tr>
		<th>
				<div class="boxes boxesColor orange"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>جانشین 2</span>	</div>
				</div>
		</th><td>
<?php
if($session->userinfo['sit2'] == 0) {
echo "<input class=\"text\" type=\"text\" name=\"v2\" maxlength=\"15\">";
}
if($session->userinfo['sit2'] != 0) {
	
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->userinfo['sit2']."&a=".$session->checker."&type=2'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"حذف جانشین\"></button>";
    echo "&nbsp;".$database->getUserField($session->userinfo['sit2'],"username",0)."";

}
?></td>
	</tr>
			</tbody></table>
            
<h4 class="round spacer">جانشین برای اکانت های دیگر</h4>
<input type="hidden" name="sitter_flag_posted" value="1">

<div class="text">اکانت های زیر شما را به عنوان جانشین خود انتخاب کرده اند. شما قادر به لغو جانشینی با کلیک بر روی علامت X قرمز رنگ میباشید</div>

<table class="sitters transparent">
				<tbody><tr>
		<th>
				<div class="boxes boxesColor lightGreen"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>جانشین 1				</span>	</div>
				</div>
		</th><td>
<?php
if(!$database->getSitee1($session->uid)){
	echo '<span class="none">وارد نشده است</span>';
    }else{
    $getsit1 = $database->getSitee1($session->uid);
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->uid."&owner=".$getsit1[id]."&a=".$session->checker."&type=3'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"حذف جانشین\"></button>";
    echo "&nbsp;".$getsit1['username']."";
    }
	
?>
</td>
	</tr>
				<tr>
		<th>
				<div class="boxes boxesColor orange"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents"><span>جانشین 2</span>	</div>
				</div>
		</th><td>
<?php
if(!$database->getSitee2($session->uid)){
	echo '<span class="none">وارد نشده است</span>';
    }else{
    $getsit2 = $database->getSitee2($session->uid);
    echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&e=3&id=".$session->uid."&owner=".$getsit2[id]."&a=".$session->checker."&type=3'; return false;\"><img src=\"img/x.gif\" class=\"del\" alt=\"حذف جانشین\"></button>";
    echo "&nbsp;".$getsit2['username']."";
    }
	
?></td>
	</tr>
			</tbody></table>
            
<h4 class="round spacer">حذف اکانت</h4>
<table cellpadding="1" cellspacing="1" id="del_acc" class="account transparent">
	<tbody>
		<tr>
			<td colspan="2">در این قسمت قادر به حذف اکانت خود می باشید. بعد از تایید، حذف اکانت شما 3 روز طول خواهد کشید.</td>
		</tr>
        
        
<?php
$timestamp = $database->isDeleting($session->uid);
if($timestamp) {
echo "<tr><td colspan=\"2\" class=\"count\">";
if($timestamp > time()+48*3600) {
echo "<button type=\"button\" value=\"del\" class=\"icon\" onclick=\"window.location.href = 'spieler.php?s=3&id=".$session->uid."&a=1&e=4'; return false;\">
                    <img src=\"img/x.gif\" class=\"del\" alt=\"del\"></button>";
        }
		$time=$generator->getTimeFormat(($timestamp-time()));
        echo " حذف اکانت در <span id=\"timer1\">".$time."</span> .</td></tr>";
}
else {
?>
			<tr>
				<th>اکانت حذف شود؟</th>
				<td class="del_selection">
					<label><input class="radio" type="radio" name="del" value="1"> بله</label>
					<label><input class="radio" type="radio" name="del" value="0" checked="checked"> خیر</label>
				</td>
			</tr>
            <tr>
				<th>با رمز تايید کنید:</th>
				<td><input class="text" type="password" name="del_pw" maxlength="20"></td>
			</tr>
            <?php 
        }
        ?>
						
                </tbody>
</table>
    <?php
if($form->getError("del") != "") {
echo "<span class=\"error\">".$form->getError("del")."</span>";
}
?>
<h4 class="round spacer">انتقال طلا</h4>
<table cellpadding="1" cellspacing="1" class="newsletter transparent">
		<tbody>
<tr>
					<td colspan="2">در حال حاضر در اکانت شما <img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین"> <b><?php echo $session->gold; ?></b> قابل انتقال می باشد.</td>
				</tr>
					</tbody>
	</table>
<br />
<div class="save_button">
<button type="submit" value="ذخیره"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">ذخیره</div></div></button></div>

</form>