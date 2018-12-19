<div class="modal fade" id="open_name_badge_container_modal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div id='printBody' class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="refreshCurrentPage();">Close</button>
                <button class="btn btn-primary btn-sm" onclick="printExecuteSingleNameBadge('{{ url('su/print_namebadge_status_updater') }}')">Print</button>
            </div>
        </div>

    </div>
</div>