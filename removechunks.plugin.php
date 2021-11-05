// RemoveChunks from display
// BBloke
// Date: 15-6-21
//
// This plugin should remove unwanted chunk names rendered to the output which should be cleared when the document is process
// Updated what it can remove.

// System Events: OnWebPagePrerender

$showMatches = false;

$re[] = '/({{(.*?)}})/mix';				// Chunks
$re[] = '/(\[\+(.*?)\+\])/mix';			// Placeholders

$output = $modx->documentOutput; // get the parsed document

foreach ( $re as $search )
{
	preg_match_all($search, $output, $matches, PREG_SET_ORDER, 0);
	$output = preg_replace($search, ' ' , $output);
}

// Print the entire match result
if ( $showMatches !== false ) var_dump($matches);

$modx->documentOutput = $output;
