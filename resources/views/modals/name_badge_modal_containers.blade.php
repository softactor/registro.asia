<div class="modal fade" id="open_name_badge_container_modal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div id='printBody' class="modal-body">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada, urna quis efficitur mollis, arcu nunc euismod ipsum, et sodales lorem odio in lectus. Ut sed tempus turpis. Vivamus iaculis fermentum quam, a facilisis nibh placerat ut. Proin risus diam, sagittis eu fringilla vel, sagittis vitae nisl. In sollicitudin maximus velit sit amet ultricies. Integer dolor nisi, lacinia sit amet ante commodo, tristique vestibulum ligula. Nam tincidunt arcu sit amet egestas gravida. Nunc hendrerit nulla egestas ipsum euismod consequat.
                </p>
                <p>
                    Aenean quis ullamcorper ligula. Aliquam nec enim vitae odio blandit sagittis a eu sem. Donec imperdiet dictum leo nec porttitor. Vivamus vehicula leo eu interdum mattis. Phasellus vitae nisi nec orci venenatis rhoncus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et nisi eu urna porta semper. Praesent non tincidunt odio, at eleifend lacus. Fusce quis sem in risus sollicitudin sodales ut sit amet ipsum. Morbi ultricies at erat ut interdum. Curabitur non convallis erat. Mauris vel molestie massa, non tristique neque. Praesent luctus enim nec neque porta, eget rutrum sapien vulputate. Suspendisse potenti.

                </p>
                <p>
                    Duis non purus orci. Morbi sed est ante. Donec vitae magna consequat, efficitur tortor et, gravida magna. In a metus est. Integer ornare purus quis eros posuere congue. Aliquam in sodales ligula. Suspendisse odio nunc, rhoncus vel ligula eget, euismod tincidunt eros. Curabitur et ligula eu neque tristique pharetra. Morbi sed tellus nisi. Cras nisi leo, fringilla non turpis nec, tempor efficitur dolor. Aenean sagittis porta odio, a auctor ligula posuere in.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="refreshCurrentPage();">Close</button>
                <button class="btn btn-primary btn-sm" onclick="printExecuteSingleNameBadge('{{ url('su/print_events_name_badge') }}', '1')">Print</button>
            </div>
        </div>

    </div>
</div>