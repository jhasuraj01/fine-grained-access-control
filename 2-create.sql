CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY ,
    first_name VARCHAR(20) NOT NULL ,
    middle_name VARCHAR(20) ,
    last_name VARCHAR(20) ,
    email VARCHAR(30) NOT NULL UNIQUE ,
    prn VARCHAR(15) NOT NULL UNIQUE ,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY ,
    resource_name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS actions (
    action_id INT AUTO_INCREMENT PRIMARY KEY ,
    action_name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY ,
    role_name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS policies (
    role_id INT NOT NULL ,
    action_id INT NOT NULL ,
    resource_id INT NOT NULL ,
    PRIMARY KEY (role_id, action_id, resource_id) ,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE ,
    FOREIGN KEY (action_id) REFERENCES actions(action_id) ON DELETE CASCADE ,
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS users_roles (

    user_id INT NOT NULL ,
    role_id INT NOT NULL ,

    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
);