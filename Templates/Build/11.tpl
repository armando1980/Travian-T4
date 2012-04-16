<h1 class="titleInHeader">انبار غذا <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid11">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(11,4);" class="build_logo">
	<img class="building big white g11" src="img/x.gif" alt="انبار غذا" title="انبار غذا" />
</a>
گندم تولید شده در گندم زار ها در انبار غذا ذخیره می شود. با ارتقاء سطح آن ظرفیت آن نیز بیشتر خواهد شد.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>ظرفیت فعلی:</th>
		<td><b><?php echo $bid11[$village->resarray['f'.$id]]['attri']; ?></b> واحد گندم</td>
	</tr>
    
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>ظرفیت در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b><?php echo $bid11[$village->resarray['f'.$id]+1]['attri']; ?></b> واحد گندم</td>
        <?php
            }
            ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>