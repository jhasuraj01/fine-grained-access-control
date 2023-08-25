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

