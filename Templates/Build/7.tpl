<h1 class="titleInHeader">ذوب آهن <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid7">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(7,4);" class="build_logo">
	<img class="building big white g7" src="img/x.gif" alt="ذوب آهن" title="ذوب آهن" />
</a>
در ذوب آهن، آهن تولید شده در معدن‌های آهن شما ذوب شده و راحت‌تر قابل استفاده در دهکده خواهد بود. بسته به سطح آن این 

ساختمان قادر به افزایش تولید آهن تا 25% می‌باشد.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>افزایش تولید فعلی:</th>
			<td><b><?php echo $bid7[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>افزایش تولید در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid7[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>