# QRCV

Qrcode video script.  This script does the following with an input file.

 * Breaks file into lots of small equal sized files.
 * Encodes each small file as a qrcode (with a sequence number at the beggining).
 * Combines all of the qrcodes into a video.

Do not ask why this was created.  

Decoding a qrcode video to the original file is such a trivial task that it is
left as an excercise to the user.  Also, this project went to great effort to
include a sequence number in order to make decoding exceedingly simple.  Should
someone bother implementing this exceedingly simple and trivial task of
decoding, please consider submitting a PR.
