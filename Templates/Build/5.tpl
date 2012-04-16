<h1 class="titleInHeader">چوب بری <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid5">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(5,4);" class="build_logo">
	<img class="building big white g5" src="img/x.gif" alt="چوب بری" title="چوب بری" />
</a>
برش و نجاری چوب‌هایی که هیزم شکن فراهم می‌سازد، در این 

ساختمان انجام می‌گیرد. بسته به سطح چوب بری شما می‌توانید سطح 

تولید چوب را تا 25% بالا ببرید.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>افزایش تولید فعلی:</th>
			<td><b><?php echo $bid5[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>افزایش تولید در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid5[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>