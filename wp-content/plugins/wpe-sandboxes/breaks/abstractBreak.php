<?php

abstract class AbstractBreak{
    var $cdesc;
    var $repl;
    var $hint;

    public function printBreakDesc(){
        echo "Customer Description:\n<blockquote>$this->cdesc</blockquote>\n";
        echo "Replication Steps:\n<blockquote>$this->repl</blockquote>\n";
        if(isset($this->author)){
            echo "<hr/>Break Author: <em>$this->author</em>\n";
        }
    }

    public function giveHint(){
        echo "Hint:\n<blockquote>$this->hint</blockquote>\n";
    }

    public function getBreakDetails(){
        return array(
            'author'=>$this->author,
            'customer_description'=>$this->cdesc,
            'replication_steps'=>$this->repl,
            'hint'=>$this->hint
        );
    }

    public abstract function breakSite();

    /* Other public functions to help with stuff */

    // Unzip plugin zip file from assets folder
    public function unzip_plugin($name){
        $plugin_zip_file = WP_PLUGIN_DIR . "/wpe-sandboxes/assets/$name.zip";
        $zip = new ZipArchive;
        $unzip = $zip->open($plugin_zip_file);
        if ( $unzip === true ) {
            $zip->extractTo(WP_PLUGIN_DIR);
            $zip->close();
        } else {
            die("Couldn't unzip plugin...");
        }
    }

    // Unzip theme zip file from assets folder
    public function unzip_theme($name){
        $plugin_zip_file = WP_PLUGIN_DIR . "/wpe-sandboxes/assets/$name.zip";
        $zip = new ZipArchive;
        $unzip = $zip->open($plugin_zip_file);
        if ( $unzip === true ) {
            $zip->extractTo(get_theme_root());
            $zip->close();
        } else {
            die("Couldn't unzip theme...");
        }
    }

    // Recursive copy for directories (plugins, themes, whatever)
    // http://stackoverflow.com/questions/2050859/copy-entire-contents-of-a-directory-to-another-using-php
    public function copy_dir($src, $dst){
        $dir = opendir($src);
        @mkdir($dst);
        while(false !== ( $file = readdir($dir)) ) {
            if (( $file != '.' ) && ( $file != '..' )) {
                if ( is_dir($src . '/' . $file) ) {
                    $this->copy_dir($src . '/' . $file,$dst . '/' . $file);
                }
                else {
                    copy($src . '/' . $file,$dst . '/' . $file);
                }
            }
        }
        closedir($dir);
    }

}
