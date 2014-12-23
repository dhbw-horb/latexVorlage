$out_dir = "output";
@default_files = ("dokumentation.tex");

$pdf_mode = 1;
$dvi_mode = 0;
$ps_mode = 0;

$recorder = 1;

$bibtex_use = 2; # remove .bbl from output on clean
# remove all temporary files which are not removed automatically from output on clean
@generated_exts = qw(fls lof lot toc glg glo gls ist lol run.xml synctex.gz);

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  my ($base_name, $path) = fileparse( $_[0] );
  pushd $path;
  my $return = system "makeglossaries $base_name";
  popd;
  return $return;
}

$pdflatex = 'internal mypdflatex %D %O %S';

sub mypdflatex {
  use File::Copy qw(copy);

  my $file = shift;
  my ($base_name, $path) = fileparse( $file );
  my $synctexfile = $path . ($base_name =~ s/\.[^.]+$//r) . ".synctex.gz";
  my $new_dir = $path . "../";
  my @args = @_;
  unshift(@args, "-synctex=1");

  $return = system 'pdflatex', @args;

  copy $file, $new_dir;
  copy $synctexfile, $new_dir;

  return $return;
}

