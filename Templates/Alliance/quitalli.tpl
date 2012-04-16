<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>اتحاد - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl"); 
?>

<h4 class="round">خروج از اتحاد</h4>

<p class="option">برای خروج از اتحاد باید رمز اکانت (کلمۀ عبور) خود را وارد 
کنید.</p>

<form method="post" action="allianz.php">
<input type="hidden" name="a" value="11">
<input type="hidden" name="o" value="11">
<input type="hidden" name="s" value="5">
		<table cellpadding="1" cellspacing="1" class="option quit transparent">
			<tbody>
				<tr>
					<th>
						رمز:					</th>
					<td>
						<input class="pass text" type="password" name="pw" maxlength="20">
					</td>
				</tr>
			</tbody>
		</table>

		<p class="option">
			<button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">تایید</div></div></button>
            </p>
	</form>
<p class="error"><?php echo $form->getError("error"); ?></p>