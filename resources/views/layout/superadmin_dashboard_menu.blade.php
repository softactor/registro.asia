<div class="nav-side-menu">
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
    <div class="menu-list">
        <ul id="menu-content" class="menu-content collapse out">
            <li>
                <a href="{{ url('/su/dashboard') }}">
                    <i class="fa fa-dashboard fa-lg"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="{{ url('/su/events') }}">
                    <i class="fa fa-calendar-o fa-lg"></i> Events
                </a>
            </li>
            <li>
                <a href="{{ url('/su/event_form') }}">
                    <i class="fa fa-calendar-times-o fa-lg"></i> Event's Form
                </a>
            </li>
            <li>
                <a href="{{ url('/su/registration_details_list') }}">
                    <i class="fa fa-calendar-times-o fa-user-circle"></i> Registration details
                </a>
            </li>
        </ul>
    </div>
</div>