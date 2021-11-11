/**
 * RemoveChunks
 *
 * Removes unpopulate chunks and placeholders
 * For use with EvoCMS v3
 *
 * @category    plugin
 * @version     1.0
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @package     evo
 * @internal    @events OnWebPagePrerender,
 * @internal    @modx_category Content
 * @internal    @properties &showMatches=0
 * @internal    @installset base
 * @reportissues https://github.com/BBloke/RemoveChunks/issues/
 * @author      BBloke
 * @lastupdate  11-11-2021
 */
 
$re[] = '/({{(.*?)}})/mix';				// Chunks
$re[] = '/(\[\+(.*?)\+\])/mix';			// Placeholders

$output = $modx->documentOutput; // get the parsed document

foreach ( $re as $search )
{
	preg_match_all($search, $output, $matches, PREG_SET_ORDER, 0);
	$output = preg_replace($search, '' , $output);
}

// Print the entire match result
if ( $showMatches == 1 ) var_dump($matches);

$modx->documentOutput = $output;
