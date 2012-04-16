<h4>هیچ ایمیلی دریافت نشد؟</h4>
<div class="activation">
			برای اینکه بتوانید تراوین بازی کنید به یک آدرس ایمیل معتبری که کد فعالسازی به آن ارسال شود نیاز دارید. در شرایط بسیار خاصی امکان دارد ایمیل ثبت نام را دریافت نکنید.
			<br>
			<br>
			دلیل می‌تواند یکی از موارد زیر باشد:

			<ul>
				<li>اشکال تایپی در آدرس ایمیل.</li>
				<li>پر شدن فضای آدرس ایمیل.</li>
				<li>دومین اشتباه: برای مثال دومین آدرس ایمیل شما ir. می‌باشد ولی شما اشتباهاً com. تایپ کرده‌اید.</li>
				<li>ایمیل اشتباهاً به پوشه‌ی اسپم آدرس ایمیل شما ارسال شده باشد.</li>
			</ul>
			می‌توانید ثبت نام خود را لغو کرده و دوباره <u>با آدرس ایمیل دیگری</u> ثبت نام کنید. آنگاه برای شما کد فعالسازی جدیدی ارسال خواهد شد.
		</div>
        <hr>
        <h4>حذف اکانت</h4>
        <form action="activate.php" method="post">
        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>" />
		<input type="hidden" name="ft" value="a3" />
			<div class="boxes activation boxesColor gray"><div class="boxes-tl"></div><div class="boxes-tr"></div><div class="boxes-tc"></div><div class="boxes-ml"></div><div class="boxes-mr"></div><div class="boxes-mc"></div><div class="boxes-bl"></div><div class="boxes-br"></div><div class="boxes-bc"></div><div class="boxes-contents">
				<table cellpadding="1" cellspacing="1" class="transparent">
					<tbody><tr class="top">
						<th>نام:</th>
						<td class="name"><?php echo $database->getActivateField($_GET['id'],"username",0); ?></td>
					</tr>
					<tr class="btm">
						<th>رمز عبور:</th>
						<td><input class="text" type="password" name="pw" maxlength="20"></td>
					</tr>
				</tbody></table>
				</div>
				</div>
			<div class="clear"></div><button type="submit" value="حذف" name="delreports" id="btn_delete" onclick="document.snd.w.value=screen.width+':'+screen.height;"><div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">حذف</div></div></button>
		</form>