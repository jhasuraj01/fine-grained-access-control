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
DROP VIEW IF EXISTS user_action_resource_map;
CREATE VIEW user_action_resource_map AS
SELECT DISTINCT user_id,
                role_name,
                action_name,
                resource_name,
                roles.role_id         AS 'role_id',
                actions.action_id     AS 'action_id',
                resources.resource_id AS 'resource_id'
FROM policies
         INNER JOIN actions
                    ON policies.action_id = actions.action_id
         INNER JOIN roles
                    ON policies.role_id = roles.role_id
         INNER JOIN resources
                    ON policies.resource_id = resources.resource_id
         INNER JOIN users_roles
                    ON policies.role_id = users_roles.role_id;

SELECT *
from user_action_resource_map
WHERE user_id = 1
  AND action_id = 1
  AND resource_id = 2
LIMIT 1;

## Check if user with `user_id` is allowed to perform action `action_id` on resource `resource_id`
DROP VIEW IF EXISTS user_policies_map;
CREATE VIEW user_policies_map AS
SELECT DISTINCT users_roles.user_id  AS 'user_id',
                policies.role_id     AS 'role_id',
                policies.action_id   AS 'action_id',
                policies.resource_id AS 'resource_id'
FROM policies
         INNER JOIN users_roles
                    ON policies.role_id = users_roles.role_id;

EXPLAIN ANALYZE SELECT *
from user_policies_map
WHERE user_id = 1
  AND action_id = 1
  AND resource_id = 2
LIMIT 1;

## Check if user with `user_id` is allowed to perform action `action_id` on resource `resource_id`
SELECT *
from policies
WHERE role_id IN (SELECT role_id
                  from users_roles
                  WHERE user_id = 1)
  AND action_id = 1
  AND resource_id = 2
LIMIT 1;

## Check if user with `user_id` is allowed to perform action `action_id` on resource `resource_id`
SELECT p.role_id, p.action_id, p.resource_id
FROM policies p
INNER JOIN users_roles ur ON p.role_id = ur.role_id
WHERE ur.user_id = 1
  AND p.action_id = 1
  AND p.resource_id = 2
LIMIT 1;
