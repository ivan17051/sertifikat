@extends('layouts.layout')

@section('title')
Agenda
@endsection

@section('agendaStatus')
active
@endsection

@php
$user = Auth::user();
@endphp

@section('content')
<!-- Modal Tambah -->
<div class="modal fade" id="modalTambah">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Tambah Agenda</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('agenda.store')}}" method="post" id="formTambahAgenda">
                @csrf

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" value="{{date('Y-m-d')}}">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Keterangan</label>
                                <textarea name="keterangan" id="keterangan" cols="30" rows="10" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info">Simpan</button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- Modal Edit -->
<div class="modal fade" id="modalEdit">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Edit Agenda</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('agenda.update', ['agenda'=>''])}}" method="post">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <input type="hidden" name="id">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" value="{{date('Y-m-d')}}">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Keterangan</label>
                                <!-- <input type="text" class="form-control" name="keterangan"> -->
                                <textarea name="keterangan" id="keterangan" cols="30" rows="10" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info" name="btnSimpanUpdate">Simpan</button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- Modal Delete -->
<div class="modal fade" id="modalHapus">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h4 class="modal-title">Hapus Agenda</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('agenda.destroy', ['id'=>''])}}" method="post">
                @csrf
                @method('DELETE')
                <div class="modal-body">
                    Anda yakin ingin hapus?
                </div>
                
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-warning">Hapus</button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- Modal Edit -->
<div class="modal fade" id="modalVerif">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Verifikasi Agenda</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <input type="hidden" name="id">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" value="{{date('Y-m-d')}}">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Keterangan</label>
                                <!-- <input type="text" class="form-control" name="keterangan"> -->
                                <textarea name="keterangan" id="keterangan" cols="30" rows="10" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info" name="btnSimpanUpdate">Verifikasi</button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <!-- <h1 class="m-0">Tampilan Awal</h1> -->
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Agenda</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-9">
                            <h3 class="card-title">Agenda</h3>
                        </div>
                        <div class="col-sm-3 text-right">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modalTambah">Tambah</button>
                        </div>
                    </div>
                    
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th hidden>ID</th>
                                <th>No</th>
                                <th>Tanggal</th>
                                <th>Status</th>
                                <th class="text-right">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($agenda as $key=>$unit)
                            <tr>
                                <td hidden>{{$unit->id}}</td>
                                <td>{{$key+1}}</td>
                                <td>{{Carbon\Carbon::make($unit->tanggal)->isoFormat('dddd, D MMMM Y')}}</td>
                                <td>@if($unit->status==0)
                                    <span class="badge badge-warning">Belum Verif</span>
                                    @elseif($unit->status==1)
                                    <span class="badge badge-success">Sudah Verif</span>
                                    @endif
                                </td>
                                <td class="text-right">
                                    @if($unit->status==0 && $user->role=='user')
                                    <button class="btn btn-warning btn-sm" onclick="edit({{$key}})"><i
                                            class="fas fa-edit fa-sm"></i> Edit</button>
                                    <button class="btn btn-danger btn-sm" onclick="hapus({{$unit->id}})"><i
                                            class="fas fa-trash fa-sm"></i> Hapus</button>
                                    @elseif($unit->status==0 && $user->role=='admin')
                                    <button class="btn btn-info btn-sm" onclick="verif({{$key}})"><i
                                        class="fas fa-eye fa-sm"></i> Lihat</button>
                                    @else
                                    <button class="btn btn-info btn-sm" onclick="edit({{$key}})"><i
                                        class="fas fa-eye fa-sm"></i> Lihat</button>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th hidden>ID</th>
                                <th>No</th>
                                <th>Tanggal</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->
@endsection

@section('script')
@include('layouts.alert')
<script>
    var myUsers = @json($agenda);

    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });

    function verif(key) {

        var j = myUsers[key];
        $modal = $('#modalVerif');

        if (j['status'] == 0) {
            
            $modal.find('[name=id]').val(j['id']).change();
            $modal.find('[name=tanggal]').val(j['tanggal']).change();
            $modal.find('[name=keterangan]').val(j['keterangan']).change();
            $modal.find('[name=tanggal]').attr('disabled', false);
            $modal.find('[name=keterangan]').attr('disabled', false);
            $modal.find('[name=btnVerif]').attr('disabled', false);

        } else if (j['status'] == 1) {

            $modal.find('[name=id]').val('').change();
            $modal.find('[name=tanggal]').val(j['tanggal']).change();
            $modal.find('[name=keterangan]').val(j['keterangan']).change();
            $modal.find('[name=tanggal]').attr('disabled', true);
            $modal.find('[name=keterangan]').attr('disabled', true);
            $modal.find('[name=btnVerif]').attr('disabled', true);

        }

        $modal.find('form').attr('action', "{{route('agenda.verif', ['id'=>''])}}/" + j['id']);
        $modal.modal('show');
    }

    function edit(key) {

        var j = myUsers[key];
        $modal = $('#modalEdit');

        if (j['status'] == 0) {
            
            $modal.find('[name=id]').val(j['id']).change();
            $modal.find('[name=tanggal]').val(j['tanggal']).change();
            $modal.find('[name=keterangan]').val(j['keterangan']).change();
            $modal.find('[name=tanggal]').attr('disabled', false);
            $modal.find('[name=keterangan]').attr('disabled', false);
            $modal.find('[name=btnSimpanUpdate]').attr('disabled', false);

        } else if (j['status'] == 1) {

            $modal.find('[name=id]').val('').change();
            $modal.find('[name=tanggal]').val(j['tanggal']).change();
            $modal.find('[name=keterangan]').val(j['keterangan']).change();
            $modal.find('[name=tanggal]').attr('disabled', true);
            $modal.find('[name=keterangan]').attr('disabled', true);
            $modal.find('[name=btnSimpanUpdate]').attr('disabled', true);

        }

        $modal.find('form').attr('action', "{{route('agenda.update', ['id'=>''])}}/" + j['id']);
        $modal.modal('show');
    }

    function hapus(id){
        
        $modal = $('#modalHapus');
        $modal.find('form').attr('action', "{{route('agenda.destroy', ['id'=>''])}}/" + id);
        $modal.modal('show');

    }

    $('#formTambahAgenda').one('submit', function() {
        $(this).find('button[type="submit"]').attr('disabled', true);
    });

</script>
@endsection