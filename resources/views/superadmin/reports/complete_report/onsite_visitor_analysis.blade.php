<?php
    foreach($feedbackData['formQuestionTableArray'] as $data){
?>
<h2><span style="text-transform: capitalize;"><?php echo $data['question_name'] ?></span></h2>
<table class="email_pdf with_border" cellspacing="0" cellpadding="0">
    <thead>
        <tr>
            <th>SlNO</th>
            <th></th>
            <th>Count</th>
            <th>%</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $count          =   1;
            $totalVisitor   =   0;
            foreach($data['question_answer_counting'] as $ans){
        ?>
        <tr>
            <td><?php echo $count; ?></td>
            <td><?php echo $ans['optionValue']; ?></td>
            <td style="text-align: center;"><?php echo $ans['counting']; ?></td>
            <td style="text-align: center;"><?php echo $ans['parcentage']; ?></td>
        </tr>
        <?php $count++; } ?>
    </tbody>
</table>
<?php } ?>