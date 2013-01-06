#!/usr/bin/perl

use warnings;
use strict;

use Spreadsheet::ParseExcel;

my $xlsFileName = "/home/harisha/HARISHA_CODING/Perl/ExcelParse/test.xls";
my $parser   = Spreadsheet::ParseExcel->new();
my $workbook = $parser->parse($xlsFileName);
my $outDocFileName = "/tmp/outputDocument.txt";
my $cell;

die $parser->error(), ".\n" if ( !defined $workbook );

open (DOC_FH, ">$outDocFileName") || die "Error Creating File $outDocFileName";

# Following block is used to Iterate through all worksheets
# in the workbook and print the worksheet content 

for my $worksheet ( $workbook->worksheets() )
{
    # Find out the worksheet ranges
    my ( $row_min, $row_max ) = $worksheet->row_range();
    my ( $col_min, $col_max ) = $worksheet->col_range();

    # start from 2nd row, where actual description starts
    for my $row ( 1 .. $row_max )
    {
        # add headers
        print DOC_FH "/************************************************************","\n";

        for my $col ( $col_min .. $col_max ) 
        {
            #add 1st row id's with semicolon
            $cell = $worksheet->get_cell (0, $col);
            print DOC_FH $cell->value(), ":\n";
            $cell = $worksheet->get_cell( $row, $col );
            #print "Value       = ", $cell->value(),       "\n";
            print DOC_FH $cell->value,"\n"; 

        }
        print DOC_FH "***************************************************************/", "\n";
    }
}
close (DOC_FH);
