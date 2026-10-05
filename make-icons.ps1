Add-Type -AssemblyName System.Drawing
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

function New-Icon([int]$size, [string]$outPath) {
  $bmp = New-Object System.Drawing.Bitmap($size, $size)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $g.Clear([System.Drawing.Color]::Transparent)

  # rounded square background with vertical gradient
  $r = $size * 0.22
  $pathObj = New-Object System.Drawing.Drawing2D.GraphicsPath
  $pathObj.AddArc(0, 0, $r, $r, 180, 90)
  $pathObj.AddArc($size - $r, 0, $r, $r, 270, 90)
  $pathObj.AddArc($size - $r, $size - $r, $r, $r, 0, 90)
  $pathObj.AddArc(0, $size - $r, $r, $r, 90, 90)
  $pathObj.CloseFigure()

  $rect = New-Object System.Drawing.Rectangle(0, 0, $size, $size)
  $c1 = [System.Drawing.Color]::FromArgb(255, 99, 102, 241)
  $c2 = [System.Drawing.Color]::FromArgb(255, 79, 70, 229)
  $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $c1, $c2, 90)
  $g.FillPath($brush, $pathObj)

  # white check mark (rounded caps)
  $pen = New-Object System.Drawing.Pen([System.Drawing.Color]::White, ($size * 0.085))
  $pen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
  $pen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
  $ax = 0.30 * $size; $ay = 0.53 * $size
  $bx = 0.45 * $size; $by = 0.67 * $size
  $cx = 0.74 * $size; $cy = 0.36 * $size
  $g.DrawLine($pen, $ax, $ay, $bx, $by)
  $g.DrawLine($pen, $bx, $by, $cx, $cy)

  # three dots = three columns
  $dotBrush = [System.Drawing.Brushes]::White
  $dr = 0.032 * $size
  foreach ($fx in 0.36, 0.50, 0.64) {
    $dx = $fx * $size - $dr
    $dy = 0.83 * $size - $dr
    $g.FillEllipse($dotBrush, $dx, $dy, $dr * 2, $dr * 2)
  }

  $g.Dispose()
  $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  Write-Host "OK $outPath ($size px)"
}

New-Icon 512 (Join-Path $root 'icons\icon-512.png')
New-Icon 192 (Join-Path $root 'icons\icon-192.png')
New-Icon 180 (Join-Path $root 'icons\apple-touch-icon.png')
