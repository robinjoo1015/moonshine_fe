create table moonshine.image
(
    image_id         serial
        primary key,
    image_path       text                                not null,
    image_created_at timestamp default CURRENT_TIMESTAMP not null,
    image_updated_at timestamp default CURRENT_TIMESTAMP not null,
    image_deleted_at timestamp,
    image_deleted    boolean   default false             not null
);

alter table moonshine.image
    owner to moonshine;

create table moonshine.ingredient
(
    ingredient_id          serial
        primary key,
    ingredient_name        varchar(255) not null,
    ingredient_description varchar(255)
);

alter table moonshine.ingredient
    owner to moonshine;

create table moonshine.cocktails
(
    cocktail_id           serial
        primary key,
    cocktail_name         varchar(255)                        not null
        unique,
    cocktail_description  varchar(255),
    cocktail_image        integer
        references moonshine.image,
    cocktail_alcoholic    boolean   default true              not null,
    cocktail_instructions text                                not null,
    cocktail_created_at   timestamp default CURRENT_TIMESTAMP not null,
    cocktail_updated_at   timestamp default CURRENT_TIMESTAMP not null,
    cocktail_deleted_at   timestamp default CURRENT_TIMESTAMP not null,
    cocktail_deleted      boolean   default false             not null,
    cocktail_signiture    boolean   default false             not null
);

alter table moonshine.cocktails
    owner to moonshine;

create table moonshine.cocktail_composition
(
    cocktail_id         integer      not null
        references moonshine.cocktails
            on update cascade on delete restrict,
    ingredient_id       integer      not null
        references moonshine.ingredient
            on update cascade on delete restrict,
    ingredient_quantity varchar(255) not null,
    composition_id      serial
        primary key
);

alter table moonshine.cocktail_composition
    owner to moonshine;

create table moonshine.users
(
    user_id              serial
        primary key,
    user_name            varchar(255)                        not null,
    user_email           varchar(255)                        not null,
    user_password        varchar(255)                        not null,
    user_profile_picture integer
        references moonshine.image,
    user_created_at      timestamp default CURRENT_TIMESTAMP not null,
    user_updated_at      timestamp default CURRENT_TIMESTAMP not null,
    user_deleted_at      timestamp default CURRENT_TIMESTAMP not null,
    user_deleted         boolean   default false             not null
);

alter table moonshine.users
    owner to moonshine;

create table moonshine.bars
(
    bar_id            serial
        primary key,
    bar_name          varchar(255)                        not null
        unique,
    bar_address       varchar(255)                        not null,
    bar_image         integer                             not null
        references moonshine.image,
    bar_latitude      double precision                    not null,
    bar_longitude     double precision                    not null,
    bar_contact       varchar(30),
    bar_description   varchar(255),
    bar_opening_hours varchar(255),
    bar_score         double precision                    not null,
    bar_created_at    timestamp default CURRENT_TIMESTAMP not null,
    bar_updated_at    timestamp default CURRENT_TIMESTAMP not null,
    bar_deleted_at    timestamp default CURRENT_TIMESTAMP not null,
    bar_deleted       boolean   default false             not null
);

alter table moonshine.bars
    owner to moonshine;

create table moonshine.bar_reviews
(
    bar_review_id         serial
        primary key,
    bar_id                integer                             not null
        references moonshine.bars,
    user_id               integer                             not null
        constraint bar_review_created_by
            references moonshine.users,
    bar_review            varchar(255)                        not null,
    bar_rating            integer                             not null,
    bar_review_created_at timestamp default CURRENT_TIMESTAMP not null,
    bar_review_updated_at timestamp default CURRENT_TIMESTAMP not null,
    bar_review_deleted_at timestamp,
    bar_review_deleted    boolean   default false             not null
);

alter table moonshine.bar_reviews
    owner to moonshine;

create table moonshine.cocktail_reviews
(
    cocktail_review_id         serial
        primary key,
    cocktail_id                integer                             not null
        references moonshine.cocktails,
    user_id                    integer                             not null
        constraint cocktail_review_created_by
            references moonshine.users,
    cocktail_review            varchar(255)                        not null,
    cocktail_rating            integer                             not null,
    cocktail_review_created_at timestamp default CURRENT_TIMESTAMP not null,
    cocktail_review_updated_at timestamp default CURRENT_TIMESTAMP not null,
    cocktail_review_deleted_at timestamp,
    cocktail_review_deleted    boolean   default false             not null
);

alter table moonshine.cocktail_reviews
    owner to moonshine;

create table moonshine.cocktail_favorites
(
    user_id     integer not null
        constraint favorite_user_id
            references moonshine.users,
    cocktail_id integer not null
        constraint favorite_cocktail_id
            references moonshine.cocktails,
    constraint favorite_id
        primary key (user_id, cocktail_id)
);

alter table moonshine.cocktail_favorites
    owner to moonshine;

create table moonshine.bar_favorites
(
    user_id integer not null
        constraint bar_favorite_user_id
            references moonshine.users,
    bar_id  integer not null
        constraint bar_favorite_bar_id
            references moonshine.bars,
    constraint bar_favorite_id
        primary key (user_id, bar_id)
);

alter table moonshine.bar_favorites
    owner to moonshine;

create table moonshine.blog_posts
(
    blog_post_id         serial
        primary key,
    blog_post_title      varchar(255)                        not null,
    blog_post_content    text                                not null,
    blog_post_user_id    integer                             not null
        references moonshine.users,
    blog_post_image      integer                             not null
        references moonshine.image,
    blog_post_type       smallint                            not null,
    blog_post_created_at timestamp default CURRENT_TIMESTAMP not null,
    blog_post_updated_at timestamp default CURRENT_TIMESTAMP not null,
    blog_post_deleted_at timestamp,
    blog_post_deleted    boolean   default false             not null
);

alter table moonshine.blog_posts
    owner to moonshine;

create table moonshine.blog_post_image_composition
(
    blog_post_id            integer not null
        references moonshine.blog_posts
            on update cascade on delete restrict,
    image_id                integer not null
        references moonshine.image
            on update cascade on delete restrict,
    blog_post_image_comment text,
    primary key (blog_post_id, image_id)
);

alter table moonshine.blog_post_image_composition
    owner to moonshine;

create table moonshine.blog_post_cocktail_composition
(
    blog_post_id integer not null
        references moonshine.blog_posts
            on update cascade on delete restrict,
    cocktail_id  integer not null
        references moonshine.cocktails
            on update cascade on delete restrict,
    primary key (blog_post_id, cocktail_id)
);

alter table moonshine.blog_post_cocktail_composition
    owner to moonshine;

create table moonshine.blog_post_bar_composition
(
    blog_post_id integer not null
        references moonshine.blog_posts
            on update cascade on delete restrict,
    bar_id       integer not null
        references moonshine.bars
            on update cascade on delete restrict,
    primary key (blog_post_id, bar_id)
);

alter table moonshine.blog_post_bar_composition
    owner to moonshine;

create table moonshine.blog_post_comments
(
    blog_post_comment_id         serial
        primary key,
    blog_post_id                 integer                             not null
        constraint blog_post_comment_blog_post_id
            references moonshine.blog_posts
            on delete cascade,
    user_id                      integer                             not null
        constraint blog_post_comment_user_id
            references moonshine.users,
    blog_post_comment_content    varchar(255)                        not null,
    blog_post_comment_created_at timestamp default CURRENT_TIMESTAMP not null,
    blog_post_comment_updated_at timestamp default CURRENT_TIMESTAMP not null,
    blog_post_comment_deleted_at timestamp,
    blog_post_comment_deleted    boolean   default false             not null
);

alter table moonshine.blog_post_comments
    owner to moonshine;

create table moonshine.blog_post_comment_replies
(
    blog_post_comment_reply_id         serial
        primary key,
    blog_post_comment_id               integer                             not null
        constraint blog_post_comment_reply_blog_post_comment_id
            references moonshine.blog_post_comments
            on delete cascade,
    user_id                            integer                             not null
        constraint blog_post_comment_reply_user_id
            references moonshine.users,
    blog_post_comment_reply_content    varchar(255)                        not null,
    blog_post_comment_reply_created_at timestamp default CURRENT_TIMESTAMP not null,
    blog_post_comment_reply_updated_at timestamp default CURRENT_TIMESTAMP not null,
    blog_post_comment_reply_deleted_at timestamp,
    blog_post_comment_reply_deleted    boolean   default false             not null
);

alter table moonshine.blog_post_comment_replies
    owner to moonshine;

create table moonshine.blog_small_post
(
    blog_small_post_id         serial
        primary key,
    blog_small_post_content    varchar(255)                        not null,
    blog_small_post_user_id    integer                             not null
        references moonshine.users,
    blog_small_post_created_at timestamp default CURRENT_TIMESTAMP not null,
    blog_small_post_updated_at timestamp default CURRENT_TIMESTAMP not null,
    blog_small_post_deleted_at timestamp,
    blog_small_post_deleted    boolean   default false             not null
);

alter table moonshine.blog_small_post
    owner to moonshine;

create table moonshine.blog_small_post_image_compostision
(
    blog_small_post_id integer not null
        references moonshine.blog_small_post
            on update cascade on delete restrict,
    image_id           integer not null
        references moonshine.image
            on update cascade on delete restrict,
    primary key (blog_small_post_id, image_id)
);

alter table moonshine.blog_small_post_image_compostision
    owner to moonshine;

create table moonshine.blog_small_post_comment
(
    blog_small_post_comment_id         serial
        primary key,
    blog_small_post_id                 integer                             not null
        constraint blog_small_post_comment_blog_small_post_id
            references moonshine.blog_small_post
            on delete cascade,
    user_id                            integer                             not null
        constraint blog_small_post_comment_user_id
            references moonshine.users,
    blog_small_post_comment_content    varchar(255)                        not null,
    blog_small_post_comment_created_at timestamp default CURRENT_TIMESTAMP not null,
    blog_small_post_comment_updated_at timestamp default CURRENT_TIMESTAMP not null,
    blog_small_post_comment_deleted_at timestamp,
    blog_small_post_comment_deleted    boolean   default false             not null
);

alter table moonshine.blog_small_post_comment
    owner to moonshine;

create table moonshine.blog_small_post_comment_reply
(
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

alter table moonshine.blog_small_post_comment_reply
    owner to moonshine;

create table moonshine.message
(
    message_id          serial
        primary key,
    message_content     varchar(255)                        not null,
    message_receiver_id integer                             not null
        constraint message_receiver_id_fkey
            references moonshine.users,
    message_sender_id   integer                             not null
        constraint message_sender_id_fkey
            references moonshine.users,
    message_created_at  timestamp default CURRENT_TIMESTAMP not null,
    message_updated_at  timestamp default CURRENT_TIMESTAMP not null,
    message_deleted_at  timestamp,
    message_deleted     boolean   default false             not null
);

alter table moonshine.message
    owner to moonshine;

create table moonshine.cocktail_image_composition
(
    cocktail_id integer not null
        references moonshine.cocktails
            on update cascade on delete restrict,
    image_id    integer not null
        references moonshine.image
            on update cascade on delete restrict,
    primary key (cocktail_id, image_id)
);

alter table moonshine.cocktail_image_composition
    owner to moonshine;

create table moonshine.bar_image_composition
(
    bar_id   integer not null
        references moonshine.bars
            on update cascade on delete restrict,
    image_id integer not null
        references moonshine.image
            on update cascade on delete restrict,
    primary key (bar_id, image_id)
);

alter table moonshine.bar_image_composition
    owner to moonshine;

create table moonshine.bar_menu_composition
(
    bar_id             integer not null
        references moonshine.bars
            on update cascade on delete restrict,
    cocktail_id        integer not null
        references moonshine.cocktails
            on update cascade on delete restrict,
    bar_cocktail_score double precision,
    bar_cocktail_price integer,
    primary key (bar_id, cocktail_id)
);

alter table moonshine.bar_menu_composition
    owner to moonshine;

create table moonshine.bar_review_menu_review
(
    bar_review_id                     integer                             not null
        references moonshine.bar_reviews
            on update cascade,
    bar_id                            integer                             not null,
    cocktail_id                       integer                             not null,
    bar_review_menu_review_content    varchar(255),
    bar_review_menu_review_created_at timestamp default CURRENT_TIMESTAMP not null,
    bar_review_menu_review_updated_at timestamp default CURRENT_TIMESTAMP not null,
    bar_review_menu_review_deleted_at timestamp,
    bar_review_menu_review_deleted    boolean   default false             not null,
    bar_review_menu_review_raing      integer                             not null,
    primary key (bar_review_id, bar_id, cocktail_id),
    foreign key (bar_id, cocktail_id) references moonshine.bar_menu_composition
        on update cascade
);

alter table moonshine.bar_review_menu_review
    owner to moonshine;


