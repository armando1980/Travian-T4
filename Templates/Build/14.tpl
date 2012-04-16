<h1 class="titleInHeader">میدان تمرین <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid14">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(14,4);" class="build_logo">
<img class="building big white g14" src="img/x.gif" alt="میدان تمرین" title="میدان تمرین" />
</a>
در میدان تمرین، لشگریان شما استقامت خود را افزايش مي دهند. با ارتقاي هرچه بيشتر اين ساختمان، سربازان شما از فاصله 30 مربع به بعد، سریعتر حرکت می کنند.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>سرعت فعلی:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]]['attri']; ?></b> درصد</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>سرعت در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]+1]['attri']; ?></b> درصد</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>