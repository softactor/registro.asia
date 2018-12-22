/**
 * Simple Jquery Form Builder (SJFB)
 * Copyright (c) 2015 Brandon Hoover, Hoover Web Development LLC (http://bhoover.com)
 * http://bhoover.com/simple-jquery-form-builder/
 * SJFB may be freely distributed under the included MIT license (license.txt).
 */

//generates the form HTML
function generateHtmlForm(currentIndex, eventFormId, urlAddress){
    $.ajax({
            method: "POST",
            url: urlAddress,
            data: 'eventFormId='+eventFormId,
            dataType: 'json',
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                //empty out the preview area
                $('#sjfb_fields_'+currentIndex).empty();
                $('#generate-form-id-'+currentIndex).val(1);
                if (response.status == 'success') {
                    if (response.data) {
                        var data = response.data.form_data;
                        if (data) {
                            
                            //go through each saved field object and render the form HTML
                            $.each(JSON.parse(data), function (k, v) {
                                var optionsLavel    =   ((v.name) ?  v.name: 'no_name');
                                var fieldType       =   v.type;
                                //Add the field
                                $('#sjfb_fields_' + currentIndex).append(addFieldHTML(fieldType, optionsLavel));
                                var $currentField = $('#sjfb_fields_' + currentIndex + ' .sjfb-field').last();
                                //Add the label
                                $currentField.find('label').text(v['label']);

                                //Any choices?
                                if (v['values']) {

                                    var uniqueID = Math.floor(Math.random() * 999999) + 1;

                                    $.each(v['values'], function (k, v) {                                        
                                        if (fieldType == 'select') {
                                            var selected = v['sel'] ? ' selected' : '';
                                            var choiceHTML = '<option' + selected + '>' + v['label'] + '</option>';
                                            $currentField.find(".choices").append(choiceHTML);
                                        } else if (fieldType == 'radio-group') {
                                            var selected = v['sel'] ? ' checked' : '';
                                            var choiceHTML = '<div class="radio"><label><input type="radio" name="' + optionsLavel + '"' + selected + ' value="' + v['label'] + '">' + v['label'] + '</label></div>';
                                            $currentField.find(".choices").append(choiceHTML);
                                        } else if (fieldType == 'checkbox-group') {
                                            var selected = v['sel'] ? ' checked' : '';
                                            var choiceHTML = '<label><input type="checkbox" name="' + optionsLavel + '[]"' + selected + ' value="' + v['label'] + '">' + v['label'] + '</label>';
                                            $currentField.find(".choices").append(choiceHTML);
                                        }

                                    });
                                }

                                //Is it required?
                                if (v['req']) {
                                    if (fieldType == 'text') {
                                        $currentField.find("input").prop('required', true).addClass('required-choice')
                                    } else if (fieldType == 'textarea') {
                                        $currentField.find("textarea").prop('required', true).addClass('required-choice')
                                    } else if (fieldType == 'select') {
                                        $currentField.find("select").prop('required', true).addClass('required-choice')
                                    } else if (fieldType == 'radio-group') {
                                        $currentField.find("input").prop('required', true).addClass('required-choice')
                                    }
                                    $currentField.addClass('required-field');
                                }

                            });
                        }
                    }

                    //HTML templates for rendering frontend form fields
                    function addFieldHTML(fieldType, name) {

                        var uniqueID = Math.floor(Math.random() * 999999) + 1;

                        switch (fieldType) {

                            case 'text':
                                return '' +
                                        '<div id="sjfb-' + uniqueID + '" class="sjfb-field sjfb-text form-group">' +
                                        '<label for="text-' + uniqueID + '"></label>' +
                                        '<input type="text" id="text-' + uniqueID + '" name="'+name+'" value="" class="form-control">' +
                                        '</div>';

                            case 'textarea':
                                return '' +
                                        '<div id="sjfb-' + uniqueID + '" class="sjfb-field sjfb-textarea form-group">' +
                                        '<label for="textarea-' + uniqueID + '"></label>' +
                                        '<textarea id="textarea-' + uniqueID + '" class="form-control" name="'+name+'"></textarea>' +
                                        '</div>';

                            case 'select':
                                return '' +
                                        '<div id="sjfb-' + uniqueID + '" class="sjfb-field sjfb-select form-group">' +
                                        '<label for="select-' + uniqueID + '"></label>' +
                                        '<select id="select-' + uniqueID + '" class="choices choices-select form-control" name="'+name+'"></select>' +
                                        '</div>';

                            case 'radio-group':
                                return '' +
                                        '<div id="sjfb-' + uniqueID + '" class="sjfb-field sjfb-radio">' +
                                        '<label></label>' +
                                        '<div class="choices choices-radio radio"></div>' +
                                        '</div>';

                            case 'checkbox-group':
                                return '' +
                                        '<div id="sjfb-checkbox-' + uniqueID + '" class="sjfb-field sjfb-checkbox">' +
                                        '<label class="sjfb-label"></label>' +
                                        '<div class="choices choices-checkbox checkbox"></div>' +
                                        '</div>';
                            case 'date':
                                return '' +
                                        '<div id="sjfb-' + uniqueID + '" class="sjfb-field sjfb-text form-group">' +
                                        '<label for="text-' + uniqueID + '"></label>' +
                                        '<input type="date" id="text-' + uniqueID + '" class="form-control" name="'+name+'">' +
                                        '</div>';
                            case 'agree':
                                return '' +
                                        '<div id="sjfb-agree-' + uniqueID + '" class="sjfb-field sjfb-agree form-group">' +
                                        '<input type="checkbox" required>' +
                                        '<label></label>' +
                                        '</div>';
                            case 'header':
                                return '' +
                                        '<div id="sjfb-agree-' + uniqueID + '" class="sjfb-field sjfb-header form-group">' +
                                        '<label></label>';
                        }
                    }
                }
            }
        });
}