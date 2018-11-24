<!-- Modal -->
<form id="namebadgefontstyleForm">
    <div id="name_badge_fields_font_style_edit" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Font Style</h4>
                </div>
                <div class="modal-body">    
                    <h4><span id="fieldsName"></span> font style</h4>
                    <div class="form-group">
                        <label for="sel1">Font unit:</label>
                        <select class="form-control" id="font_unit" name="font_unit">
                            <option value="">Please select</option>
                            <option value="px">px</option>
                            <option value="pt">pt</option>
                            <option value="em">em</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="usr">Font size:</label>
                        <input type="text" class="form-control" id="font_size" name="font_size">
                    </div>                
                    <div class="form-group">
                        <label for="sel1">Font weight:</label>
                        <select class="form-control" id="font_weight" name="font_weight">
                            <option value="">Please select</option>
                            <option value="normal">Normal</option>
                            <option value="bold">Bold</option>
                        </select>
                    </div>            
                </div>
                <div class="modal-footer">
                    <?php
                    $save_url = url('su/saveNamebadgeFontStyle');
                    ?>
                    <input type="hidden" name="nameBadgeFieldsId" id="nameBadgeFieldsId" value="">  
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-default" onclick="saveNamebadgeFontStyle('{{ $save_url }}');">Save</button>
                </div>
            </div>

        </div>
    </div>
</form>