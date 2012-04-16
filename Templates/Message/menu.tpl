
<div class="contentNavi subNavi">
<div title="" class="<?php if(!isset($_GET['t'])) { echo "container active"; }else{ echo "container normal"; } ?>">
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="nachrichten.php"><span class="tabItem">صندوق پیام</span></a></div>
</div>
<div title="" class="<?php if(isset($_GET['t']) && $_GET['t'] == 1) { echo "container active"; }else{ echo "container normal"; } ?>">
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="nachrichten.php?t=1"><span class="tabItem">نوشتن</span></a></div>
</div>
<div title="" class="<?php if(isset($_GET['t']) && $_GET['t'] == 2) { echo "container active"; }else{ echo "container normal"; } ?>">
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="nachrichten.php?t=2"><span class="tabItem">فرستاده شده</span></a></div>
</div>
<?php if($session->plus) { ?>
<div class="<?php if(isset($_GET['t']) && $_GET['t'] == 3) { echo "container active"; }else{ echo "container normal"; } ?>">
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="nachrichten.php?t=3"><span class="tabItem">آرشیو</span></a></div>
</div>
<div class="<?php if(isset($_GET['t']) && $_GET['t'] == 4) { echo "container active"; }else{ echo "container normal"; } ?>">
<div class="background-start">&nbsp;</div>
<div class="background-end">&nbsp;</div>
<div class="content"><a href="nachrichten.php?t=4"><span class="tabItem">یادداشت ها</span></a></div>
</div>
<?php } ?>

<div class="clear"></div>
</div>
