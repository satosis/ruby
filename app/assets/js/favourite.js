$(function () {
    $(".js-add-favourite").on('click', function (event) {
      event.preventDefault();
      let URL = "/products/ajax_favourite/" + this.parentElement.id;
      $.ajax({
        headers: {
          "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
        },
        method: "POST",
        url: URL,
      }).done(function (result) {
        if (result.status == 1) {
          $(".js-add-favourite i").removeClass("fa-heart-o");
          $(".js-add-favourite i").addClass("fa-heart");
          $(".js-add-favourite i").addClass("red");
        } else if (result.status == 2) {
          $(".js-add-favourite i").removeClass("fa-heart");
          $(".js-add-favourite i").removeClass("red");
          $(".js-add-favourite i").addClass("fa-heart-o");
        }
        $this.parents("h1").find(".favourite").text(result.count);
      });
    });

    let $item = $("#ratings i");
    let arrTextRating = {
      1: "Rất tồi tệ",
      2: "Tồi tệ",
      3: "Tốt",
      4: "Xuất sắc",
      5: "Tuyệt vời",
    };
    $item.mouseover(function () {
      let $this = $(this);
      let $i = $this.attr("data-i");
      $("#review_value").val($i);
      $item.removeClass("r-active");
      $item.each(function (key, value) {
        if (key + 1 <= $i) {
          $(this).addClass("r-active");
        }
      });
      $("#review_text").addClass("review_text");
      $("#review_text").text(arrTextRating[$i]);
    });
    $(".js-process-view").click(function (event) {
      event.preventDefault();
      let URL = $(this).parents("form").attr("action");
      $.ajax({
        method: "POST",
        headers: {
          "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
        },
        url: URL,
        data: $(".form-question").serialize(),
      }).done(function (result) {
        $(".form-question")[0].reset();
        console.log(result.html);
        if (result.html) {
          $(".review_list").prepend(result.html);
          $(".review_list_personal").prepend(result.personal);
        }
        swal(result.messages, "", "success");
      });
    });

    $("body").on("click", ".pagination a", function (event) {
      event.preventDefault();

      $("li").removeClass("active");
      $(this).parent("li").addClass("active");
      let URL = $(this).attr("href");
      var myurl = URL;
      var page = URL.split("page=")[1];

      getRatingList(page);
    });

    function getRatingList(page) {
      $.ajax({
        type: "GET",
        url: "?page=" + page,
      }).success(function (results) {
        $(".review_list_personal").html(results.html);
      });
    }
  });
