CREATE SCHEMA IF NOT EXISTS MOONSHINE;

CREATE TABLE IF NOT EXISTS MOONSHINE.IMAGE (
    image_id SERIAL PRIMARY KEY,
    image_path VARCHAR(255) NOT NULL,
    image_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    image_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    image_deleted_at TIMESTAMP,
    image_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS MOONSHINE.INGREDIENT (
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(255) NOT NULL,
    ingredient_description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS MOONSHINE.COCKTAILS (
    cocktail_id SERIAL PRIMARY KEY,
    cocktail_name VARCHAR(255) NOT NULL,
    cocktail_description VARCHAR(255),
    cocktail_image INT,
    FOREIGN KEY (cocktail_image) REFERENCES MOONSHINE.IMAGE (image_id),
    cocktail_instructions VARCHAR(255) NOT NULL,
    cocktail_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cocktail_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cocktail_deleted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cocktail_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS MOONSHINE.COCKTAIL_COMPOSITION (
    cocktail_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    ingredient_quantity VARCHAR(20) NOT NULL,
    PRIMARY KEY (cocktail_id, ingredient_id),
    FOREIGN KEY (cocktail_id)
        REFERENCES MOONSHINE.COCKTAILS (cocktail_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (ingredient_id)
        REFERENCES MOONSHINE.INGREDIENT (ingredient_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.USERS (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_profile_picture INT,
    FOREIGN KEY (user_profile_picture) REFERENCES MOONSHINE.IMAGE (image_id),
    user_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_deleted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BARS (
    bar_id SERIAL PRIMARY KEY,
    bar_name VARCHAR(255) NOT NULL,
    bar_address VARCHAR(255) NOT NULL,
    bar_image INT NOT NULL,
    FOREIGN KEY (bar_image) REFERENCES MOONSHINE.IMAGE (image_id),
    bar_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bar_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bar_deleted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bar_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BAR_REVIEWS (
    bar_review_id SERIAL PRIMARY KEY,
    bar_id INT NOT NULL,
    FOREIGN KEY (bar_id) REFERENCES MOONSHINE.BARS (bar_id),
    user_id INT NOT NULL,
    bar_review VARCHAR(255) NOT NULL,
    bar_rating INT NOT NULL,
    bar_review_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bar_review_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bar_review_deleted_at TIMESTAMP,
    bar_review_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT bar_review_created_by FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.COCKTAIL_REVIEWS (
    cocktail_review_id SERIAL PRIMARY KEY,
    cocktail_id INT NOT NULL,
    FOREIGN KEY (cocktail_id) REFERENCES MOONSHINE.COCKTAILS (cocktail_id),
    user_id INT NOT NULL,
    cocktail_review VARCHAR(255) NOT NULL,
    cocktail_rating INT NOT NULL,
    cocktail_review_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cocktail_review_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cocktail_review_deleted_at TIMESTAMP,
    cocktail_review_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT cocktail_review_created_by FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.COCKTAIL_FAVORITES (
    user_id INT NOT NULL,
    cocktail_id INT NOT NULL,
    CONSTRAINT favorite_id PRIMARY KEY (user_id, cocktail_id),
    CONSTRAINT favorite_user_id FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT favorite_cocktail_id FOREIGN KEY (cocktail_id)
        REFERENCES MOONSHINE.COCKTAILS (cocktail_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BAR_FAVORITES (
    user_id INT NOT NULL,
    bar_id INT NOT NULL,
    CONSTRAINT bar_favorite_id PRIMARY KEY (user_id, bar_id),
    CONSTRAINT bar_favorite_user_id FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT bar_favorite_bar_id FOREIGN KEY (bar_id)
        REFERENCES MOONSHINE.BARS (bar_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_POSTS (
    blog_post_id SERIAL PRIMARY KEY,
    blog_post_title VARCHAR(255) NOT NULL,
    blog_post_content text NOT NULL,
    blog_post_user_id INT NOT NULL,
    blog_post_image INT NOT NULL,
    blog_post_type SMALLINT NOT NULL,
    FOREIGN KEY (blog_post_image) REFERENCES MOONSHINE.IMAGE (image_id),
    blog_post_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_post_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_post_deleted_at TIMESTAMP,
    blog_post_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (blog_post_user_id) REFERENCES MOONSHINE.USERS (user_id)
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_POST_IMAGE_COMPOSITION (
    blog_post_id INT NOT NULL,
    image_id INT NOT NULL,
    blog_post_image_comment text,
    PRIMARY KEY (blog_post_id, image_id),
    FOREIGN KEY (blog_post_id)
        REFERENCES MOONSHINE.BLOG_POSTS (blog_post_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (image_id)
        REFERENCES MOONSHINE.IMAGE (image_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_POST_COCKTAIL_COMPOSITION (
    blog_post_id INT NOT NULL,
    cocktail_id INT NOT NULL,
    PRIMARY KEY (blog_post_id, cocktail_id),
    FOREIGN KEY (blog_post_id)
        REFERENCES MOONSHINE.BLOG_POSTS (blog_post_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (cocktail_id)
        REFERENCES MOONSHINE.COCKTAILS (cocktail_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_POST_BAR_COMPOSITION (
    blog_post_id INT NOT NULL,
    bar_id INT NOT NULL,
    PRIMARY KEY (blog_post_id, bar_id),
    FOREIGN KEY (blog_post_id)
        REFERENCES MOONSHINE.BLOG_POSTS (blog_post_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (bar_id)
        REFERENCES MOONSHINE.BARS (bar_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_POST_COMMENTS (
    blog_post_comment_id SERIAL PRIMARY KEY,
    blog_post_id INT NOT NULL,
    user_id INT NOT NULL,
    blog_post_comment_content VARCHAR(255) NOT NULL,
    blog_post_comment_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_post_comment_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_post_comment_deleted_at TIMESTAMP,
    blog_post_comment_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT blog_post_comment_blog_post_id FOREIGN KEY (blog_post_id)
        REFERENCES MOONSHINE.BLOG_POSTS (blog_post_id)
        ON DELETE CASCADE,
    CONSTRAINT blog_post_comment_user_id FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_POST_COMMENT_REPLIES (
    blog_post_comment_reply_id SERIAL PRIMARY KEY,
    blog_post_comment_id INT NOT NULL,
    user_id INT NOT NULL,
    blog_post_comment_reply_content VARCHAR(255) NOT NULL,
    blog_post_comment_reply_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_post_comment_reply_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_post_comment_reply_deleted_at TIMESTAMP,
    blog_post_comment_reply_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT blog_post_comment_reply_blog_post_comment_id FOREIGN KEY (blog_post_comment_id)
        REFERENCES MOONSHINE.BLOG_POST_COMMENTS (blog_post_comment_id)
        ON DELETE CASCADE,
    CONSTRAINT blog_post_comment_reply_user_id FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_SMALL_POST (
    blog_small_post_id SERIAL PRIMARY KEY,
    blog_small_post_content VARCHAR(255) NOT NULL,
    blog_small_post_user_id INT NOT NULL,
    blog_small_post_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_small_post_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_small_post_deleted_at TIMESTAMP,
    blog_small_post_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (blog_small_post_user_id) REFERENCES MOONSHINE.USERS (user_id)
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_SMALL_POST_IMAGE_COMPOSTISION (
    blog_small_post_id INT NOT NULL,
    image_id INT NOT NULL,
    PRIMARY KEY (blog_small_post_id, image_id),
    FOREIGN KEY (blog_small_post_id)
        REFERENCES MOONSHINE.BLOG_SMALL_POST (blog_small_post_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (image_id)
        REFERENCES MOONSHINE.IMAGE (image_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_SMALL_POST_COMMENT (
    blog_small_post_comment_id SERIAL PRIMARY KEY,
    blog_small_post_id INT NOT NULL,
    user_id INT NOT NULL,
    blog_small_post_comment_content VARCHAR(255) NOT NULL,
    blog_small_post_comment_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_small_post_comment_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_small_post_comment_deleted_at TIMESTAMP,
    blog_small_post_comment_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT blog_small_post_comment_blog_small_post_id FOREIGN KEY (blog_small_post_id)
        REFERENCES MOONSHINE.BLOG_SMALL_POST (blog_small_post_id)
        ON DELETE CASCADE,
    CONSTRAINT blog_small_post_comment_user_id FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BLOG_SMALL_POST_COMMENT_REPLY (
    blog_small_post_comment_reply_id SERIAL PRIMARY KEY,
    blog_small_post_comment_id INT NOT NULL,
    user_id INT NOT NULL,
    blog_small_post_comment_reply_content VARCHAR(255) NOT NULL,
    blog_small_post_comment_reply_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_small_post_comment_reply_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    blog_small_post_comment_reply_deleted_at TIMESTAMP,
    blog_small_post_comment_reply_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT blog_small_post_comment_reply_blog_small_post_comment_id FOREIGN KEY (blog_small_post_comment_id)
        REFERENCES MOONSHINE.BLOG_SMALL_POST_COMMENT (blog_small_post_comment_id)
        ON DELETE CASCADE,
    CONSTRAINT blog_small_post_comment_reply_user_id FOREIGN KEY (user_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.MESSAGE (
    message_id SERIAL PRIMARY KEY,
    message_content VARCHAR(255) NOT NULL,
    message_receiver_id INT NOT NULL,
    message_sender_id INT NOT NULL,
    message_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    message_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    message_deleted_at TIMESTAMP,
    message_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT message_receiver_id_fkey FOREIGN KEY (message_receiver_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION,
    CONSTRAINT message_sender_id_fkey FOREIGN KEY (message_sender_id)
        REFERENCES MOONSHINE.USERS (user_id)
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS MOONSHINE.COCKTAIL_IMAGE_COMPOSITION (
    cocktail_id INT NOT NULL,
    image_id INT NOT NULL,
    PRIMARY KEY (cocktail_id, image_id),
    FOREIGN KEY (cocktail_id)
        REFERENCES MOONSHINE.COCKTAILS (cocktail_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (image_id)
        REFERENCES MOONSHINE.IMAGE (image_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BAR_IMAGE_COMPOSITION (
    bar_id INT NOT NULL,
    image_id INT NOT NULL,
    PRIMARY KEY (bar_id, image_id),
    FOREIGN KEY (bar_id)
        REFERENCES MOONSHINE.BARS (bar_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (image_id)
        REFERENCES MOONSHINE.IMAGE (image_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BAR_MENU_COMPOSITION (
    bar_id INT NOT NULL,
    cocktail_id INT NOT NULL,
    PRIMARY KEY (bar_id, cocktail_id),
    FOREIGN KEY (bar_id)
        REFERENCES MOONSHINE.BARS (bar_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (cocktail_id)
        REFERENCES MOONSHINE.COCKTAILS (cocktail_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MOONSHINE.BAR_REVIEW_MENU_REVIEW (
    bar_review_id INT NOT NULL,
    bar_id INT NOT NULL,
    cocktail_id INT NOT NULL,
    bar_review_menu_review_content VARCHAR(255),
    bar_review_menu_review_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bar_review_menu_review_updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bar_review_menu_review_deleted_at TIMESTAMP,
    bar_review_menu_review_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    bar_review_menu_review_raing INT NOT NULL,
    PRIMARY KEY (bar_review_id, bar_id, cocktail_id),
    FOREIGN KEY (bar_review_id)
        REFERENCES MOONSHINE.BAR_REVIEWS (bar_review_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    FOREIGN KEY (bar_id, cocktail_id)
        REFERENCES MOONSHINE.BAR_MENU_COMPOSITION (bar_id, cocktail_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

