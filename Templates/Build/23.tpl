<h1 class="titleInHeader">مخفیگاه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

<div id="build" class="gid23"><div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(23,4);" class="build_logo">
	<img class="building big white g23" src="img/x.gif" alt="مخفیگاه" title="مخفیگاه" />
</a>
مخفيگاه اين امكان را براي شما فراهم مي كند كه مقداري از منابع خود را مخفي كرده و از دست ديگر بازيكنان كه قصد غارت آنرا دارند دور نگه داريد.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>مقدار فعلی قابل پنهان کردن از هر نوع:</th>
		<td><b>
        <?php
		if($session->tribe == 3) {
		echo $bid23[$village->resarray['f'.$id]]['attri']*2;
        } else {
        echo $bid23[$village->resarray['f'.$id]]['attri'];
        }
        ?>        
        </b> واحد</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>مقدار قابل پنهان کردن در سطح <?php echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b>
        <?php
		if($session->tribe == 3) {
		echo $bid23[$village->resarray['f'.$id]+1]['attri']*2;
        } else {
        echo $bid23[$village->resarray['f'.$id]+1]['attri'];
        }
        ?>
        
        </b> واحد</td>
        <?php
            }
            ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>