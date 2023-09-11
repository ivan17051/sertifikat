<!--primary theme Modal -->
<div class="modal fade text-left" id="searchpegawai" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel160" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
        role="document">
        <div class="modal-content" style="overflow: visible!important;">
            <div class="modal-header bg-primary">
                <h5 class="modal-title white" id="searchpegawailabel">Cari Pegawai
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal"
                    aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="typeahead__container ">
                    <div class="typeahead__field">
                        <div class="form-group typeahead__query">
                            <input class="form-control js-typeahead"
                                name="q"
                                autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('script2')
<script type="text/javascript">
var callback=function(){};
$(document).ready(function(){
    $.typeahead({
        input: ".js-typeahead",
        dynamic: true, 
        order: "asc",
        display: ["nama", "nip"],
        emptyTemplate: "Tidak ditemukan",
        source: {
            pegawai: {
                // Ajax Request
                ajax: {
                    type: 'GET',
                    url: '{{route("search.pegawai")}}',
                }
            }
        },
        callback: {
            onShowLayout: function(node, query){
                let resultcontainer=node.closest('.typeahead__field').next('.typeahead__result');
                $('#searchpegawai .modal-content').append(resultcontainer);
            },
            onClick: function(node, a, item, event){
                callback(item);
            }
        },
        selector:{
            result: 'typeahead__result c-typeahead',
        }
    });
});
</script>
@endpush