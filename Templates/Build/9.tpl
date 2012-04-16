<h1 class="titleInHeader">نانوایی <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid9">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(9,4);" class="build_logo">
	<img class="building big white g9" src="img/x.gif" alt="نانوایی" title="نانوایی" />
</a>
در نانوایی از آرد تولید شده در آسیاب نان تولید می‌شود. بسته 

به سطح آن این ساختمان قادر به افزایش تولید گندم تا 50% می‌باشد.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>افزایش تولید فعلی:</th>
			<td><b><?php echo $bid9[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>افزایش تولید در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid9[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>