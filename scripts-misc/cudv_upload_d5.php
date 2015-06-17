<?
$_SERVER['REMOTE_ADDR'] = '127.0.0.1';
define("DRUPAL_ROOT", dirname(realpath(__FILE__)));
require_once('includes/bootstrap.inc');
drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

$orders = db_query("SELECT txnid FROM ec_transaction");

while($o = db_fetch_object($orders)) {
	$order = store_transaction_load($o->txnid);
	$user = user_load(array("uid" => $order->uid));
	$products = array();

	foreach($order->items as $item) {
		$node = node_load($item->nid);
		cudv_client_d5_create_product_if_none($node);
		$products[] = $node->nid;
	}

	$d7uid = cudv_client_d5_create_user_if_none($user);
	printf("%d\n", $d7uid);
	if(is_int($d7uid)) {
		$partner = cudv_client_d5_get_product_partner(node_load(reset($products)));
		cudv_api_post_order($order->txnid, $d7uid, $partner, 1, $order->gross, $products, $order->created);
	}
}
?>
