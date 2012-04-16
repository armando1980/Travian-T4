<h1 class="titleInHeader">قهوه خانه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid35">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(35,4);" class="build_logo">
        <img class="building big white g35" src="img/x.gif" alt="قهوه خانه" title="قهوه خانه"></a>
        قهوه و چایی در قهوه خانه تولید می شود که بعد از تولید از طرف سربازان در جشن ها مصرف می شود. این باعث افزایش قدرت سربازان در جنگ خواهد شد، ولی متاسفانه باعث کاهش قدرت چیف (رئیس) خواهد شد و منجنیق ها تنها قادر به هدفگیری تصادفی خواهند بود. قادر به ساخت این ساختمان تنها در پایتخت خود می باشید ولی تاثیر آن به کل امپراطوری خواهد بود.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>تولید سطح فعلی:</th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>تولید در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>