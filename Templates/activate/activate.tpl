<?php
if(isset($_GET['id']) && isset($_GET['q'])) {
$act2 = $database->getActivateField($_GET['id'],"act2",0);
	if($act2 == $_GET['q']){
		$show = '1';
		$name = $database->getActivateField($_GET['id'],"username",0);
		$email = $database->getActivateField($_GET['id'],"email",0);
	}
}

if(isset($show)){
?>
<div class="activation">
				سلام <?php echo $name; ?>,
				<br>
				<br>
				ثبت نام شما موفقیت آمیز بود. در عرض چند دقیقه برای شما ایمیلی با اطلاعات اکانت و کد فعال سازی ارسال خواهد شد.
<br><br>
ایمیل به آدرس مقابل ارسال شده است: <span class="email"><b><?php echo $email; ?></b></span>
			</div>
            
            <div class="activation">
				برای فعال سازی اکانت کد فعال سازی را وارد کنید و یا روی لینک فعال سازی موجود در ایمیل خود کلیک کنید.
			</div>
            
            <form action="activate.php" method="post">
				<div class="code"><b>
					کد فعال سازی:</b>
				</div>
				<div>
					<input class="text" type="text" name="id" maxlength="10" />
                    <button type="submit" value="ارسال" name="s1" id="btn_send" class="sendActivation">
                    
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">ارسال</div></div></button></div>
			</form>
            <hr>
            
            <div class="no_mail">
				<a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email,5); ?>">هیچ ایمیلی دریافت نکردید؟</a>
				<br>
				بعضی اوقات نامه به پوشۀ اسپم ایمیل منتقل می شود. برای راهنمایی بیشتر کلیک کنید. <a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email,5); ?>">اینجا</a>
			</div>
            
            <?php } else {
?>
			<div id="activation">
				<form action="activate.php" method="post">
						<b>کد فعالسازی:</b><br />
					<input class="text" type="text" name="id" maxlength="10" />
                        <button type="submit" value="Send" name="s1" id="btn_send" onclick="document.snd.w.value=screen.width+':'+screen.height;">
       					 <div class="button-container">
                         <div class="button-position">
                         <div class="btl">
                         <div class="btr">
                         <div class="btc"></div></div></div>
                         <div class="bml">
                         <div class="bmr">
                         <div class="bmc"></div></div></div>
                         <div class="bbl">
                         <div class="bbr">
                         <div class="bbc"></div></div></div></div>
       					 <div class="button-contents">ارسال</div></div>
        				</button>
                        <input type="hidden" name="ft" value="a2" />
				</form>
                </div>
			
<?php }
?>