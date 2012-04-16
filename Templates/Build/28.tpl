<h1 class="titleInHeader">دفتر تجارت <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid28">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(28,4);" class="build_logo">
        <img class="building big white g28" src="img/x.gif" alt="دفتر تجارت" title="دفتر تجارت"></a>
        در دفتر تجارت می توانید گاری های تجار را پیشرفت دهید و به اسبهای قوی تر مجهز کنید. گاری های پیشرفته تر ظرفیت حمل بیشتری خواهند داشت.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>ظرفیت حمل کنونی:</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>ظرفیت حمل در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>
