<?
$_SERVER['REMOTE_ADDR'] = '127.0.0.1';
define("DRUPAL_ROOT", dirname(realpath(__FILE__)));
require_once('includes/bootstrap.inc');
drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

$orders = db_query("SELECT order_id FROM uc_orders");

foreach($orders as $o) {
    if($order->status == "abandoned") {
        continue;
    }

    $order = uc_order_load($o->order_id);
    $user = user_load($order->uid);
    $products = array();

    foreach($order->products as $product) {
        $product->sell_price = $product->price; //wtffffff
        cudv_client_d7_create_product_if_none($product);
        $products[] = $product->nid;
    }
    $partner = cudv_client_d7_get_product_partner(reset($order->products));

    print_r(cudv_client_d7_create_user_if_none($user));
    print_r(cudv_api_post_order($order->order_id, $user->uid, $partner, "discount", $order->order_total, $products, $order->created));
}
?>
