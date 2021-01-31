select 'Welcome to Woocommerce Development DB Factory!!' AS '';

#Posts
SELECT 'Deleting unneeded posts...' AS '';
DELETE FROM wp_posts WHERE post_type NOT IN ('page', 'custom_css', 'product', 'product_variation', 'attachment', 'nav_menu_item');
select 'Done' AS '';
#Posts meta
SELECT 'Deleting unneeded postmeta...' AS '';
DELETE FROM wp_postmeta WHERE NOT EXISTS (SELECT null FROM wp_posts WHERE ID = post_id);
select 'Done' AS '';

#user and usermeta
select 'Deleting usermeta and users...' AS '';
truncate wp_usermeta;
truncate wp_users;
select 'Done' AS '';

#Add site admin Password: '46)jIZFvLm#zkVwCF8x@)wwO'
select 'Creating admin user...' AS '';
INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BTh//OYslZPcXZ3G19w2ZAqXCo374i/', 'admin', 'admin@admin.com', '', '2020-04-01 13:44:22', '', 0, 'Super Admin');
select 'Done' AS '';

select 'Adding admin privileges...' AS '';
INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'Admin'),
(2, 1, 'first_name', 'Admin'),
(3, 1, 'last_name', 'Admin'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', 'en_US'),
(12, 1, 'mobile', ''),
(13, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(14, 1, 'wp_user_level', '10');
select 'Done' AS '';

#order items, itemmeta
select 'Truncating itemmeta and items...' AS '';
truncate wp_woocommerce_order_itemmeta;
truncate wp_woocommerce_order_items;
select 'Done' AS '';

#order notes
select 'Deleting orders\' notes...' AS '';
delete from wp_commentmeta where comment_id in (select comment_ID from wp_comments where comment_type = 'order_note');
delete from wp_comments where comment_type = 'order_note';
select 'Done' AS '';

#options
select 'Deleting options...' AS '';
delete from wp_options where REGEXP_LIKE(option_name, '^[0-9]{9}$');
select 'Done' AS '';

#api keys
select 'Truncating API keys...' AS '';
truncate wp_woocommerce_api_keys;
select 'Done' AS '';

#wallet transactions
select 'Truncating woo_wallet_transactions/transaction_meta...' AS '';
truncate wp_woo_wallet_transaction_meta;
truncate wp_woo_wallet_transactions;
select 'Done' AS '';

#other tables
select 'Truncating other tables...' AS '';
truncate wp_wc_order_product_lookup;
truncate wp_woocommerce_sessions;
truncate wp_sms_send;
truncate wp_actionscheduler_logs;
truncate wp_mailchimp_jobs;
truncate wp_ywcars_messages;
truncate wp_actionscheduler_actions;
truncate wp_wc_order_stats;
truncate wp_wc_customer_lookup;
truncate wp_yoast_seo_meta;
truncate wp_wc_order_tax_lookup;
truncate wp_mailchimp_carts;
truncate wp_wc_order_coupon_lookup;
select 'Done' AS '';


select 'Database has been cleaned successfully.' AS '';
