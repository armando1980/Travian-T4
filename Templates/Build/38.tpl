<h1 class="titleInHeader">انبار بزرگ <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid38">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(38,4);" class="build_logo">
        <img class="building big white g38" src="img/x.gif" alt="انبار بزرگ" title="انبار بزرگ"></a>
        آهن, چوب و خشت، در انبار ذخیره میشوند. انبار بزرگ به شما فضای بیشتری میدهد تا منابع بیشتری ذخیره کنید.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>ظرفیت فعلی:</th>
		<td><b><?php echo $bid38[$village->resarray['f'.$id]]['attri']; ?></b> واحد منابع</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>ظرفیت در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b><?php echo $bid38[$village->resarray['f'.$id]+1]['attri']; ?></b> واحد منابع</td>
        <?php
            }
            ?>
	</tr>
	</table>
 <?php 
include("upgrade.tpl");
?>
</p></div>