$("#client_task_list").html("<%= escape_javascript(render 'shared/client_task_list') %>");

$("#pending_tasks").html("<%= escape_javascript(render 'shared/pending_tasks') %>");