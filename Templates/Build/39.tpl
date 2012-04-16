<h1 class="titleInHeader">انبار غذای بزرگ <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid39">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(39,4);" class="build_logo">
        <img class="building big white g39" src="img/x.gif" alt="انبار غذای بزرگ" title="انبار غذای بزرگ"></a>
        گندم و غذاها در انبار غذا ذخیره میشود. انبار غذای بزرگ به شما این امکان را میدهد تا غذای بیشتری ذخیره کنید</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>ظرفیت فعلی:</th>
		<td><b><?php echo $bid39[$village->resarray['f'.$id]]['attri']; ?></b> واحد منابع</td>
	</tr>
    
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>ظرفیت در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b><?php echo $bid39[$village->resarray['f'.$id]+1]['attri']; ?></b> واحد منابع</td>
        <?php
            }
            ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>