<h1 class="titleInHeader">آسیاب <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid8">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(8,4);" class="build_logo">
	<img class="building big white g8" src="img/x.gif" alt="آسیاب" title="آسیاب" />
</a>
در آسیاب از گندم تولیدی در گندم زار ها آرد تولید می شود. بسته به سطح آن این ساختمان قادر به افزایش تولید گندم تا 25% می باشد.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>افزایش تولید فعلی:</th>
			<td><b><?php echo $bid8[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>افزایش تولید فعلی در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid8[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>