<h1 class="titleInHeader">قصر <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid26">
<div class="build_desc">
	<a href="#" onClick="return Travian.Game.iPopup(26,4, 'gid');" class="build_logo"> 
    <img class="building big white g26" src="img/x.gif" alt="قصر" title="قصر" /> </a>
	در قصر شاه و ملکه امپراطوری زندگی می کنند. شما در کل امپراطوری فقط یک قصر می توانید داشته باشید. فقط دهکده ای که قصر شما در آن است را می توانید به پایتخت خود تبدیل کنید (شما نمی توانید در یک دهکده قصر و اقامتگاه را با هم داشته باشید).</div>

<?php 
include("upgrade.tpl");
include("26_menu.tpl"); 
?>

<p>برای توسعه امپراطوری خود به ميزان مشخصي از امتیاز فرهنگی احتیاج دارید. امتیاز فرهنگی هر روز به میزان مشخصی رشد می کند، میزان رشد آن بستگی به سطح ساختمانهای شما دارد.</p>

<table cellpadding="1" cellspacing="1" id="build_value">
<tr>
	<th>رشد امتیاز فرهنگی در این دهکده:</th>
	<td><b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> امتياز فرهنگی در هر روز</td>
</tr>
<tr>
	<th>رشد امتیاز فرهنگی در تمام دهکده ها:</th>
	<td><b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> امتياز فرهنگی در هر روز</td>
</tr>
</table><p>دهکده شما در حال حاضر <b><?php echo $database->getUserField($session->uid, 'cp',0); ?></b> امتیاز فرهنگی دارد. برای بنا یا تصرف دهکده جدید شما به <b><?php $mode = CP; $total = count($database->getProfileVillages($session->uid)); echo ${'cp'.$mode}[$total+1]; ?></b> امتیاز نیاز دارید.</p>
</div>
