<div class="table-responsive">
    <table id="table_quick_report" class="table table_quick_report table-bordered">
        <thead>
            <tr>
                <th>Online</th>
                <th>Onsite</th>
                <th>Import</th>
                <th>Attended</th>
                <th>Turnout</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><?php echo $staticsData['online']; ?></td>
                <td><?php echo $staticsData['onsite']; ?></td>
                <td><?php echo $staticsData['import']; ?></td>
                <td rowspan="2"><?php echo $staticsData['attended']; ?></td>
                <td rowspan="2">
                    <?php 
                        $turnOut    =   ($staticsData['attended']*100)/$staticsData['sum_of_all'];
                        echo number_format((float)$turnOut, 2, '.', '') . "%";  // Outputs -> 105.00$turnOut. '%';
                        ?>
                </td>
            </tr>
            <tr>
                <td colspan="3"><?php echo $staticsData['sum_of_all']; ?></td>
            </tr>
        </tbody>
    </table>
</div>