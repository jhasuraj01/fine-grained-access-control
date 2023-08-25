## Get All the policies of a user give a user_id, first_name
SELECT DISTINCT action_name, resource_name
FROM policies
         INNER JOIN actions
                    ON actions.action_id = policies.action_id
         INNER JOIN roles
                    ON roles.role_id = policies.role_id
         INNER JOIN resources
                    ON resources.resource_id = policies.resource_id
         INNER JOIN users_roles
                    ON users_roles.role_id = policies.role_id
         INNER JOIN users
                    ON users_roles.user_id = users.user_id
WHERE users.first_name = 'Suraj';

## Check if user with `user_id` is allowed to perform action `action_id` on resource `resource_id`
SELECT user_id, role_name, action_name, resource_name
FROM policies
INNER JOIN actions
ON policies.action_id = actions.action_id
INNER JOIN roles
ON policies.role_id = roles.role_id
INNER JOIN resources
ON policies.resource_id = resources.resource_id
INNER JOIN users_roles
ON policies.role_id = users_roles.role_id
WHERE user_id = 2 AND actions.action_id = 1 AND resources.resource_id = 2
LIMIT 1;