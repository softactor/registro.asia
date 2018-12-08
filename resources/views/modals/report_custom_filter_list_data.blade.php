<!-- Modal -->
<div class="modal fade" id="report_custom_filter_list_data" role="dialog">
    <div class="modal-dialog report_modal_style">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="pull-left">Custom Report.</h2>
                <button type="button" class="btn btn-primary pull-right" onclick="documents_pdf('generate_table');">PDF</button>
                <button type="button" class="btn btn-primary pull-right" onclick="documents_print('generate_table');">PRINT</button>
            </div>
            <div class="modal-body">
                <span id="generate_table"></span>
                <div id="editor"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>