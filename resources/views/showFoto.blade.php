<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <form action="{{route('absensi.destroy',['id'=>'0'])}}" method="post">
        @csrf
        @method("DELETE")
        <button type="submit">Hapus</button>
    </form>
    @foreach($foto as $unit)
    <ul>{{$unit}}</ul>
    @endforeach
</body>
</html>