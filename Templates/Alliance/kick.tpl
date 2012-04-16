<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$memberlist = $database->getAllMember($aid);
$allianceinfo = $database->getAlliance($aid);
echo "<h1>اتحاد - ".$allianceinfo['tag']."</h1>";
include("alli_menu.tpl"); 
?>
<h4 class="round">اخراج بازیکن</h4>
			<form method="post" action="allianz.php">
				<table cellpadding="1" cellspacing="1" id="position" class="small_option">
					<tbody>
						<tr>
							<th colspan="2">در این قسمت شما میتوانید بازیکن از اتحاد اخراج کنید</th>
						</tr>
						<tr>
							<th>نام:</th>
							<td>
								<select name="a_user" class="name dropdown">
								<?php
                                foreach($memberlist as $member) {
                                echo "<option value=".$member['id'].">".$member['username']."</option>";
                                }
                                ?>
                                </select>
							</td>
						</tr>
					</tbody>
				</table>
				<p>
					<input type="hidden" name="o" value="2">
					<input type="hidden" name="s" value="5">
					<input type="hidden" name="a" value="2">
                    <button type="submit" value="ok" name="s1" id="btn_ok"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">اخراج</div></div></button>
				</p>
			</form>
			<p class="error"></p>