<?php
include("../GameEngine/Database/connection.php");
include("../GameEngine/config.php");
$time = time();
rename("../install/","../installed_".$time);
?>
<div id="content" class="login">
<div class="headline"><h2>پایان نصب اسکریپت</h2></div><br>
<br>
&nbsp;&nbsp;نصب بازی با موفقیت به پایان رسید
    <h4>&nbsp;&nbsp;برای امنیت بیشتر نام پوشه نصب به طور خودکار تغییر کرد.<br/><br/>
    &nbsp;&nbsp;فایل config.php جایگزین شد.</h4>
  
<br /><br />

<div align="center"><font size="4"><a href="<?php echo HOMEPAGE; ?>"> صفحه اصلی</font></a>
</div></div>
