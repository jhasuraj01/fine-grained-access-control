INSERT INTO users (user_id, first_name, middle_name, last_name, email, prn, phone_number)
    VALUES (1, 'Suraj', NULL, 'Jha', 'suraj@example.com', '120B1F001', "+9167451051");
INSERT INTO users (user_id, first_name, middle_name, last_name, email, prn, phone_number)
    VALUES (2, 'Madhav', NULL, 'Jha', 'madhav@example.com', '120B1F002', "+9167451551");

INSERT INTO actions (action_id, action_name) VALUES (1, 'create');
INSERT INTO actions (action_id, action_name) VALUES (2, 'read');
INSERT INTO actions (action_id, action_name) VALUES (3, 'update');
INSERT INTO actions (action_id, action_name) VALUES (4, 'delete');

INSERT INTO resources(resource_name) VALUES ('users');
INSERT INTO resources(resource_name) VALUES ('jobs');

INSERT INTO roles(role_id, role_name) VALUES (1, 'super_admin');
INSERT INTO roles(role_id, role_name) VALUES (2, 'tpo');

# Allow all to Super Admin
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 1, 1);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 2, 1);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 3, 1);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 4, 1);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 1, 2);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 2, 2);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 3, 2);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (1, 4, 2);

# Allow all actions on 'job' to 'tpo'
INSERT INTO policies(role_id, action_id, resource_id) VALUES (2, 1, 2);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (2, 2, 2);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (2, 3, 2);
INSERT INTO policies(role_id, action_id, resource_id) VALUES (2, 4, 2);

# Atatch supper_admin & tpo role to 'Suraj'
INSERT INTO users_roles(user_id, role_id) VALUES (1, 1);
INSERT INTO users_roles(user_id, role_id) VALUES (1, 2);

# Atatch tpo role to 'Suraj'
INSERT INTO users_roles(user_id, role_id) VALUES (2, 2);