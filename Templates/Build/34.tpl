<h1 class="titleInHeader">سنگ تراشی <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid34">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(34,4);" class="build_logo">
        <img class="building big white g34" src="img/x.gif" alt="سنگ تراشی" title="سنگ تراشی"></a>
        سنگ تراشی باعث افزایش استقامت ساختمان ها و دیوار دهکده می شود. هر قدر سطح آن بالا باشد استقامت ساختمان ها و دیوار بیشتر خواهد بود. تاثیر آن به تمامی معادن، مزارع، ساختمان ها و دیوار می باشد.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>استقامت فعلی:</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>استقامت در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>